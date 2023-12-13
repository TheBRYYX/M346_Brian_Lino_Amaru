import javax.imageio.IIOImage;
import javax.imageio.ImageIO;
import javax.imageio.ImageWriteParam;
import javax.imageio.ImageWriter;
import javax.imageio.stream.ImageOutputStream;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Iterator;

public class BildKomprimierungHandler {
    public File fileHandler (File file) {
        BufferedImage inputImage = null;
        try {
            inputImage = ImageIO.read(file);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        Iterator<ImageWriter> writers = ImageIO.getImageWritersByFormatName("jpg");
        ImageWriter writer = writers.next();

        File outputFile = new File("output.jpg");
        ImageOutputStream outputStream = null;
        try {
            outputStream = ImageIO.createImageOutputStream(outputFile);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        writer.setOutput(outputStream);

        ImageWriteParam params = writer.getDefaultWriteParam();
        params.setCompressionMode(ImageWriteParam.MODE_EXPLICIT);
        params.setCompressionQuality(0.5f);

        try {
            writer.write(null, new IIOImage(inputImage, null, null), params);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        try {
            outputStream.close();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        writer.dispose();
        return null; // ToDo return wert anpassen
    }
}

