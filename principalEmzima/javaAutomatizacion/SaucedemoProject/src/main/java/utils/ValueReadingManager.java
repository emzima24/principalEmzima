package utils;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import org.jetbrains.annotations.NotNull;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class ValueReadingManager {
    private static String url, user, pass, jsonUsersString, jsonProductsString, jsonShippingInformationString, fsName, lsName,pstCode,xpathTitle, xpathImage, idAdd;
    private JsonObject jsonUsers, jsonProducts, jsonShippingInformation, caseUser, casePassword, caseFsName, caseLsName, casePstCode, caseTitle, caseImage, caseIdAdd;

    Properties properties = new Properties();
    public static @NotNull ValueReadingManager getInstance(){
        ValueReadingManager instance = new ValueReadingManager();
        instance.loadData();
        return instance;
    }

    private void loadData() {
        try(FileInputStream input = new FileInputStream("src/main/resources/values.properties")){
            properties.load(input);
        } catch (IOException e){
            e.printStackTrace();
        }
        url = properties.getProperty("url");
        jsonUsersString = properties.getProperty("jsonUsers");
        jsonUsers = JsonParser.parseString(jsonUsersString).getAsJsonObject();
        jsonProductsString = properties.getProperty("jsonProducts");
        jsonProducts = JsonParser.parseString(jsonProductsString).getAsJsonObject();
        jsonShippingInformationString = properties.getProperty("jsonShippingInformation");
        jsonShippingInformation = JsonParser.parseString(jsonShippingInformationString).getAsJsonObject();
    }

    public String getUrl() {
        return url;
    }

    public String getUsername(String environmentTest) {
        caseUser = jsonUsers.getAsJsonObject(environmentTest);
        user = caseUser.get("USERNAME").getAsString();
        return user;
    }

    public String getPassword(String environmentTest) {
        casePassword = jsonUsers.getAsJsonObject(environmentTest);
        pass = casePassword.get("PASSWORD").getAsString();
        return pass;
    }

    public String getAddId(String product) {
        caseIdAdd = jsonProducts.getAsJsonObject(product);
        idAdd = caseIdAdd.get("id_add_cart").getAsString();
        return idAdd;
    }

    public String getTitleXpath(String product) {
        caseTitle = jsonProducts.getAsJsonObject(product);
        xpathTitle = caseTitle.get("xpath_title").getAsString();
        return xpathTitle;
    }

    public String getImageXpath(String product) {
        caseImage = jsonProducts.getAsJsonObject(product);
        xpathImage = caseImage.get("xpath_image").getAsString();
        return xpathImage;
    }

    public String getFirstName(String example) {
        caseFsName = jsonShippingInformation.getAsJsonObject(example);
        fsName = caseFsName.get("firstName").getAsString();
        return fsName;
    }

    public String getLastName(String example) {
        caseLsName = jsonShippingInformation.getAsJsonObject(example);
        lsName = caseLsName.get("lastName").getAsString();
        return lsName;
    }

    public String getPostalCode(String example) {
        casePstCode = jsonShippingInformation.getAsJsonObject(example);
        pstCode = casePstCode.get("postalCode").getAsString();
        return pstCode;
    }
}


