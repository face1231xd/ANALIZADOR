package AS_Y_AL;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class Principal {
    
    public static void main(String[] args)  throws Exception{
        
        String ruta1 = "D:/OneDrive/Escritorio/Examen_Final_CYLP/ParedesCalderonCarlosManuel_EF/src/AS_Y_AL/Lexer.flex";
    //C:\Users\Luis Cuya\Documents\NetBeansProjects\Analizador Lexico Sintactico\src\ALS\Jcup.flex
        String ruta2 = "D:/OneDrive/Escritorio/Examen_Final_CYLP/ParedesCalderonCarlosManuel_EF/src/AS_Y_AL/Jcup.flex";
        String[]RutaS = {"-parser","SintaxisC","D:/OneDrive/Escritorio/Examen_Final_CYLP/ParedesCalderonCarlosManuel_EF/src/AS_Y_AL/SintaxisC.cup"}; 
        //C:\Users\Luis Cuya\Documents\NetBeansProjects\Analizador Lexico Sintactico\src\ALS\SintaxisC.cup
        generarLexYSintac(ruta1,ruta2,RutaS);
    
    }
    public static void generarLexYSintac(String ruta1, String ruta2,String[]RutaS )throws Exception, IOException{
        File archivo;
        archivo = new File (ruta1);
        JFlex.Main.generate(archivo);
        
        archivo = new File (ruta2);
        JFlex.Main.generate(archivo);
        
        java_cup.Main.main(RutaS);
        //ESTABLESCO LA  RUTA DE LOS SIMBOLOS Y MUEVO EL ARCHIVO
        Path rutaSym = Paths.get("D:/OneDrive/Escritorio/Examen_Final_CYLP/ParedesCalderonCarlosManuel_EF/src/AS_Y_AL/sym.java");
        if (Files.exists(rutaSym)){
            Files.delete(rutaSym);
        }
        
        Files.move(
                Paths.get("D:/OneDrive/Escritorio/Examen_Final_CYLP/ParedesCalderonCarlosManuel_EF/sym.java"), 
                Paths.get("D:/OneDrive/Escritorio/Examen_Final_CYLP/ParedesCalderonCarlosManuel_EF/src/AS_Y_AL/sym.java")
        );
        //LA RUTA DEL SINTACTICO
        
        Path rutaSin =  Paths.get("D:/OneDrive/Escritorio/Examen_Final_CYLP/ParedesCalderonCarlosManuel_EF/src/AS_Y_AL/SintaxisC.java");
        if(Files.exists(rutaSin)){
            Files.delete(rutaSin);
        }
        Files.move(
                Paths.get("D:/OneDrive/Escritorio/Examen_Final_CYLP/ParedesCalderonCarlosManuel_EF/SintaxisC.java"),
                Paths.get("D:/OneDrive/Escritorio/Examen_Final_CYLP/ParedesCalderonCarlosManuel_EF/src/AS_Y_AL/SintaxisC.java")
                );
        
    }
    
    
}
