import net.sf.saxon.xqj.SaxonXQDataSource;

import javax.xml.xquery.*;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;

public class FLWOR_XML {
    public static void main(String[] args) {

//    Use Java and FLWOR expression to read data from a given file called NASAtemperatureAbnormal.xml.
//    The given file contains the temperature deviation values from norm for each month, each year, and each season.
//-Find the highest and lowest deviation value of each year.
//    For each year, show year, the max value, the month of max, the min value, and the month of min.

        try {
            InputStream inputStream = new FileInputStream(new File("src/GetTemperature.xqy"));
            XQDataSource xqDataSource = new SaxonXQDataSource();
            XQConnection connection = xqDataSource.getConnection();

            XQPreparedExpression expression = connection.prepareExpression(inputStream);

            XQResultSequence result = expression.executeQuery();

            while (result.next()) {
                System.out.println(result.getItemAsString(null));
            }

        } catch (FileNotFoundException | XQException e) {
            e.printStackTrace();
        }
    }
}
