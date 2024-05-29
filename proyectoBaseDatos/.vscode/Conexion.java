import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.Scanner; 


public class Conexion{
    String bd = ""; 
    String url = "jdbc:mysql://localhost:3306/";
    String user = "root"; 
    String password = "43810218"; //poner la contrasena de ustedes para conectar al servidor
    String driver = "com.mysql.cj.jdbc.Driver";
    Connection cx; 


    // metodo constructor 
    public Conexion (String bd)  {
        this.bd = bd; 
    }

    public Connection conectar(){
    try {
        Class.forName(driver);
        cx = DriverManager.getConnection(url + bd, user, password);
        System.out.println("Se conecto a la base de datos" + " " + bd);
        } catch (ClassNotFoundException | SQLException ex){
            System.out.println("No se conecto a la base de datos" + bd);
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE,null,ex);
        }
        return cx;
    }

    public void desconectar() {
        try {
            cx.close();
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE,null,ex);
        }
    }


    public static void main (String[] args){
        Conexion conectarBd = new Conexion("ProyectoBD"); 
        conectarBd.conectar();

        Scanner teclado = new Scanner(System.in);
        int opcion;
        

        System.out.println("Menu de opciones del cine.");
        do {
                System.out.println("1- Insertar un cine.");
                System.out.println("2- Insertar una sala en un cine."); 
                System.out.println("3- Listar todos los cines con la información de sus salas.");
                System.out.println("4- Salir.");
                System.out.print("Ingrese una opcion:"); 
                opcion = teclado.nextInt();
                switch (opcion) {
                    case 1:
                        System.exit(0);
                        break;
                    case 2: 
                    System.exit(0);
                        break; 
                    case 3:
                        System.exit(0);
                        break;
                    case 4: 
                        System.exit(0);
                        break; 
                    default:
                        System.out.println("ingrese una opcion valida.");
                }
        } while (opcion != 4);

    }

}