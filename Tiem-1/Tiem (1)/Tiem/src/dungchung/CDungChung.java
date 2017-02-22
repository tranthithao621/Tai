package dungchung;



public class CDungChung {
	public static String server = "localhost";
	public static String dbName = "FPT";
	public static String userName = "sa";
	public static String password = "12345678";
	public static String url = String.format("jdbc:sqlserver://%s;databaseName=%s",server, dbName);
	
}
