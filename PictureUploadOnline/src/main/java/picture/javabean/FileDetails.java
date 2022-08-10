package picture.javabean;

public class FileDetails {
	
	private int fileid;
	private String filename;
	private byte[] filedata;
	private String filepath;
	
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
	
	public void setFiledata(byte[] filedata) {
		this.filedata = filedata;
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

	public byte[] getFiledata() {
		return filedata;
	}

	public String getFilepath() {
		return filepath;
	}

}
