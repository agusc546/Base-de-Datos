
import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.Scanner; 


public class DBConnection {
    private String db = "";
    private String password;
    private Connection connection;


    public DBConnection (String bd)  {
        this.db = bd;
    }

    public DBConnection (String db, String password) {
        this.db = db;
        this.password = password;
    }

    public String getDb() {
        return db;
    }

    public void setConnection(Connection connection) {
        this.connection = connection;
    }

    public Connection getConnection() {
        return connection;
    }

    public String getPassword() {
        return password;
    }

    public Connection connect(){
    try {
        String driver = "com.mysql.cj.jdbc.Driver";
        Class.forName(driver);
        String user = "root";
        String url = "jdbc:mysql://localhost:3306/";
        setConnection(DriverManager.getConnection(url + this.getDb(), user, this.getPassword()));
        System.out.println("Se conectó a la base de datos " + this.getDb() + " con éxito");
        } catch (ClassNotFoundException | SQLException ex){
            System.out.println("No se pudo conectar a la base de datos: " + this.getDb());
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE,null,ex);
            System.exit(0);
        }
        return this.getConnection();
    }

    public void disconnect() {
        try {
            this.getConnection().close();
        } catch (SQLException ex) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE,null,ex);
        }
        System.out.println(STR."\nLa base de datos \{this.getDb()} se cerró con extio");
        System.exit(0);
    }


    public static void main (String[] args){
        Scanner input = new Scanner(System.in);
       
        System.out.print("Ingrese el nombre de su base de datos: ");
        String DBName = input.nextLine();
       
        System.out.print("Ingrese la contraseña de su base de datos: ");
        String password = input.nextLine();
        System.out.println("");

        DBConnection database = new DBConnection(DBName, password);

        database.connect();

        int option;
        System.out.println("\nMenu de opciones del cine:");
        do {
            System.out.println("\n1- Insertar un cine");
            System.out.println("2- Insertar una sala en un cine");
            System.out.println("3- Listar todos los cines con la información de sus salas");
            System.out.println("4- Salir");
            System.out.print("Ingrese una opcion: ");
            option = input.nextInt();
            switch (option) {
                case 1:
                    insertCinema(database);
                    break;
                case 2:
                    insertRoom(database);
                    break;
                case 3:
                    listarCinesConSalas(database);
                    break;
                case 4:
                    database.disconnect();
                default:
                    System.out.println("Ingrese una opción válida por favor.");
            }
        } while (option != 4);

    }

    public static void listarCinesConSalas(DBConnection database) {
        String query = "SELECT cine.*, sala.* FROM cine " +
                "INNER JOIN sala ON cine.nombre_cine = sala.nombre_cine";

        try (PreparedStatement statement = database.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                String cinemaName = resultSet.getString("nombre_cine");
                int salaId = resultSet.getInt("nro_sala");
                System.out.println("Nombre del cine: " + cinemaName + ", " + "Numero de sala: " + salaId);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void insertCinema(DBConnection database) {
        Scanner input = new Scanner(System.in);
        System.out.println("Ingrese nombre: ");
        String cinemaName = input.nextLine();
        System.out.println("Ingrese dirección: ");
        String address = input.nextLine();
        System.out.println("Ingrese teléfono: ");
        String telNumber = input.nextLine();

        String query = "INSERT INTO Cine (nombre_cine, direccion, telefono) VALUES (?, ?, ?)";

        try (PreparedStatement statement = database.prepareStatement(query)) {
            statement.setString(1, cinemaName);
            statement.setString(2, address);
            statement.setString(3, telNumber);
            statement.executeUpdate();
            System.out.println("Cine agregado exitosamente.");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void insertRoom(DBConnection database) {
        Scanner input = new Scanner(System.in);
        System.out.println("Ingrese número de sala: ");
        String nroSala = input.nextLine();
        System.out.println("Ingrese cantidad de butacas: ");
        String cantSeats = input.nextLine();
        System.out.println("Ingrese nombre del cine: ");
        String cineName = input.nextLine();

        String query = "INSERT INTO Sala (nro_sala, cant_butacas, nombre_cine) VALUES (?, ?, ?)";

        try (PreparedStatement statement = database.prepareStatement(query)) {
            statement.setString(1, nroSala);
            statement.setString(2, cantSeats);
            statement.setString(3, cineName);
            statement.executeUpdate();
            System.out.println("Sala agregada exitosamente.");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private PreparedStatement prepareStatement(String c) throws SQLException {
        return this.getConnection().prepareStatement(c);
    }


}