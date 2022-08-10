package picture.javabean;

public class FileDetails {
	
	private int fileid;
	private String filename;
	private String filepath; // replaces filedata in PostgreSQL, to store path of the file
	
	// Constructor
	public FileDetails() {
		
	}

	// Setter
	public void setFileid(int fileid) {
		this.fileid = fileid;
	}
	
	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	
	// Getter
	public int getFileid() {
		return fileid;
	}

	public String getFilename() {
		return filename;
	}

	public String getFilepath() {
		return filepath;
	}

}
