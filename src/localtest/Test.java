package localtest;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class Test {
	
	public static final String LOOK_AT_ME = "3939DID";

	private static final int ENCRYPT_KEY = 50;
	/**
	 * @param args
	 * @throws IOException 
	 * @throws ParseException 
	 */
	public static void main(String[] args) throws IOException, ParseException {
		//generateProfileIn();
		//generateInsertSQL();
		//sqlInForIERP();
		sqlIn();
		
	}
	private static void generateInsertSQL() throws IOException{
		String sqlTemplate = "insert into ebcc.rpt_wiz_virtual values('#C1#','#C2#','#C3#')";
		BufferedReader br = new BufferedReader(new FileReader("c:\\web\\result.txt"));
		while(br.ready()){
			String line = br.readLine();
			if(line.trim().length()>0){
				String[] values = line.split(",");
				String sql = sqlTemplate.replace("#C1#", values[0].trim()).replace("#C2#", values[1].trim()).replace("#C3#", values[2].trim());
				System.out.println(sql+",");
			}
		}
	}
	private static String getSql(){
		StringBuffer sqlQuery = new StringBuffer();
		String schema = "db2ent";
		String cCDataSourceOwner = "ebcc";
		String aUniqueId = "2700011KGE";
		String application = "EBCC";

		sqlQuery.append("SELECT DISTINCT rtrim(a.unique_id), rtrim(a.application), a.company_id, rtrim(a.user_type), rtrim(b.scope_1), rtrim(b.scope_2), rtrim(b.scope_3), rtrim(b.scope_4) ")
		.append("FROM ").append(schema).append(".user_entitlement a, ").append(schema).append(".user_scope b ")
		.append("WHERE a.unique_id = '").append(aUniqueId).append("' AND ")
		.append("a.application = '").append(application).append("' AND ")
		.append("(a.user_type LIKE 'U%' OR a.user_type LIKE 'T%') AND ")
		.append("a.unique_id = b.unique_id AND ")
		.append("a.application = b.application AND ")
		.append("a.company_id = b.company_id ")
		.append("ORDER BY 1, 2, 3, 4" );
		
		return sqlQuery.toString();
	}
	private static void matchPattern(String input) throws IOException{
		BufferedReader br = new BufferedReader(new FileReader("c:\\web\\temp.txt"));
		Pattern p = Pattern.compile("^[_A-Za-z0-9-]+(\\.[_A-Za-z0-9-]+)*@[_A-Za-z0-9-]+(\\.[_A-Za-z0-9-]+)*(\\.[A-Za-z]{2,})$"); 
		int count = 0;
		while(br.ready()){
			String line = br.readLine();
			if(line!=null&&line.trim().length()>0){
				Matcher matcher = p.matcher(line.trim());
				if(!matcher.matches()){
					System.out.println(line.trim()+" pass validate: "+ matcher.matches());
					count++;
				}
			}
		}
		System.out.println("Not pass count: "+count);
		br.close();
		
		Matcher matcher = p.matcher(input);
		System.out.println(input + " validation: "+matcher.matches());
	}
	
	private static void generateProfileIn() throws IOException{
		BufferedWriter bw = new BufferedWriter(new FileWriter("c:\\web\\temp.txt"));
		File f = new File("c:\\ibmacct\\");
		File[] files = f.listFiles(new FilenameFilter(){
			private String tag = ".csv";
			@Override
			public boolean accept(File dir, String name) {
				return name.toLowerCase().endsWith(tag);
			}
			
		});
		int count=0;
		for(int i=0;i<files.length;i++){
			File csvFile = files[i];
			
			BufferedReader br = new BufferedReader(new FileReader(csvFile));
			int j=0;
			while(br.ready()){
				j++;
				String line = br.readLine().trim();
				bw.write(line);
				bw.newLine();
			}
			System.out.println(csvFile.getName()+ " file have "+ j + " rows.");
			count = count + j;
			br.close();
		}
		
		bw.flush();
		bw.close();
		sqlIn();
		System.out.println(count);
	}
	
	private static void processStrings() throws IOException {
		BufferedReader br = new BufferedReader(new FileReader("c:\\web\\temp.txt"));
		BufferedWriter bw = new BufferedWriter(new FileWriter("c:\\web\\out.txt"));
		while(br.ready()){
			String line = br.readLine();
			
			if(line!=null&&line.trim().length()>0){
				line = line.replace(" ", "");
				bw.write(line);
				bw.newLine();
				System.out.println(line);
			}
		}
		bw.flush();
	}
	
	private static void compareFiles() throws IOException {
		BufferedReader br1 = new BufferedReader(new FileReader("c:\\IERP\\ierpTemp.txt"));
		BufferedReader br2 = new BufferedReader(new FileReader("c:\\web\\out.txt"));
		ArrayList<String> list1 = new ArrayList<String>();
		ArrayList<String> list2 = new ArrayList<String>();
		while(br1.ready()){
			String line = br1.readLine();
			if(line!=null&&line.trim().length()>0){
				list1.add(line.trim());
			}
		}
		
		while(br2.ready()){
			String line = br2.readLine();
			if(line!=null&&line.trim().length()>0){
				list2.add(line.trim());
			}
		}
		
		for(String temp1: list1){
			for(String temp2: list2){
				if(temp1.trim().equalsIgnoreCase(temp2.trim())){
					System.out.println(temp1.trim());
				}
			}
		}

	}
	
	private static void compareInRows() throws IOException {
		BufferedReader br = new BufferedReader(new FileReader("c:\\IERP\\AI_MANUF.txt"));
		BufferedWriter bw = new BufferedWriter(new FileWriter("c:\\web\\out.txt"));
		int i=0;
		int index = 0;
		while(br.ready()){
			
			String line = br.readLine();
			
			/*if(line!=null&&line.trim().length()>0){
				if(line.trim().length()<10){
					line = "0"+line.trim();
				}
			}*/
			
			if(line!=null&&line.trim().length()>0){
				String[] ttt = line.split(",");
				String type = ttt[0].trim();
				String contract_serial = ttt[1].trim();
				String manuf_serial = ttt[2].trim();
				if(contract_serial!=null&&contract_serial.trim().length()>0){
					if(!contract_serial.equals(manuf_serial)){
						System.out.println(type+"-"+contract_serial);
						bw.write(type+"-"+contract_serial);
						bw.newLine();
						
					}
				}
			}
		}
		bw.flush();
		br.close();
		bw.close();

	}

	
	public static void findDupRows() throws IOException {
		BufferedReader br = new BufferedReader(new FileReader("c:\\IERP\\LM_ASSET_ITEM.txt"));
		List<String> distinctRows = new ArrayList<String>();
		Map<String, Integer> dupRows = new HashMap<String, Integer>();
		int i = 0, j=0;
		while (br.ready()) {
			String line = br.readLine();
			if (line != null && line.trim().length() > 0) {
				String[] ttt = line.split(",");
				String row1 = ttt[0].trim();
				String row2 = ttt[1].trim();
				String thisRow = row1+"-"+row2;
				if(distinctRows.contains(thisRow)){
					System.out.println(thisRow);
					if(dupRows.get(thisRow)==null){
						dupRows.put(thisRow, 1);
					}else{
						Integer count = dupRows.get(thisRow);
						count++;
						dupRows.put(thisRow, count);
					}
					
				}else{
					distinctRows.add(thisRow);
				}
				i++;
			}
		}

		System.out.println("total lines="+i);
		System.out.println("distinct lines="+distinctRows.size());
		Iterator it = dupRows.keySet().iterator();
		int totalDupCount = 0;
		while(it.hasNext()){
			totalDupCount += dupRows.get(it.next());
		}
		System.out.println("dup distinct="+dupRows.keySet().size()+" elements with total "+totalDupCount+ " dup lines.");
		br.close();
	}
	
	private static void sqlInForIERP() throws IOException {
		BufferedReader br = new BufferedReader(new FileReader("c:\\IERP\\LM_ASSET_ITEM_SQL.txt"));
		BufferedWriter bw = new BufferedWriter(new FileWriter("c:\\web\\out.txt"));
		String[] temp = {"","","","","","","","",""};
		int i=0;
		int index = 0;
		while(br.ready()){
			
			String line = br.readLine();
			if(line!=null&&line.trim().length()>0){
				String[] ttt = line.split(",");
				String machine_type = ttt[0].trim();
				String serial = ttt[1].trim();
				String new_serial = ttt[2].trim();
				String key1 = machine_type+"-"+ serial;
				String key2 = machine_type+"-"+ new_serial;
				if(key1!=null&&key1.trim().length()>0){
					i++;
					if(i>40000){
						index++;
						i=0;
					}
					temp[index] += "'"+key1.trim() + "',";
					
				}
				if(key2!=null&&key2.trim().length()>0){
					i++;
					if(i>40000){
						index++;
						i=0;
					}
					temp[index] += "'"+key2.trim() + "',";
					
				}
			}
		}
		for(int j=0;j<9;j++){
			bw.write(temp[j]);
			bw.newLine();
			System.out.println(temp[j]);
		}
		bw.flush();
		br.close();
		bw.close();

	}

	public static String getMonitorSQL(){
		StringBuffer sb = new StringBuffer();
		sb.append("SELECT A.SRC, RTRIM ( A.\"TABLE\" ) AS \"TABLE\", RTRIM ( B.COUNTRY_NAME )");
		sb.append("AS COUNTRY_NAME, B.COUNTRY_CODE, A.LOAD_DATE, C.FIELD_NAME, C.FIELD_VALUE,");
		sb.append("CASE WHEN A.LOAD_DATE > C.FIELD_VALUE THEN 'PF DID NOT RUN' ELSE '' END AS ");
		sb.append("FLAG FROM EBCC.LOAD_SEQ A INNER JOIN EBCC.COUNTRY B ON B.SAPCC = A.SRC INNER JOIN ");
		sb.append("EBCC.STAGING_COUNTRY_PARMS C ON C.COUNTRY_CODE = B.COUNTRY_CODE ");
		sb.append("WHERE NOT (A.LOAD_DATE IS NULL) AND (A.\"TABLE\" IN ('STEP_PAYMENT')) ");
		sb.append("AND (C.FIELD_NAME = 'PAYMENT_FORECAST_LAST_RUN') ");
		sb.append("AND (C.COUNTRY_CODE IN ('616', '618', '624', '649', '655', '661', '668',");
		sb.append("'672', '678', '693', '702', '704', '706', '708', '724', '738', '740',");
		sb.append("'744', '756', '758', '760', '766', '778', '781', '788', '796', '806',");
		sb.append("'815', '818', '820', '822', '834', '838', '846', '848', '856', '858',");
		sb.append("'864', '866', '897')) AND A.LOAD_DATE > C.FIELD_VALUE ORDER BY FLAG,  B.COUNTRY_CODE");
		return sb.toString();
	}
	
	private static void testCSV() throws IOException{
		BufferedReader br = new BufferedReader(new FileReader("c:\\ibmacct\\users_deleted_20190712.csv"));
		BufferedWriter bw = new BufferedWriter(new FileWriter("c:\\web\\out.txt"));
		int i=0;
		while(br.ready()){
			i++;
			String line = br.readLine();
			System.out.println(i+":"+line);
		}
	}
	
	private static void testMethod(){
		String[][] temp = {{"ALL", "user1"},{"ALL", "user2"},{"1111", "USER3"},{"2222", "USER4"},{"5555", "USER7"},{"5555", "USER8"},{"2222", "USER9"}};
		Map<String, List<String>> tempMap = new HashMap<String, List<String>>();
		for(int i=0; i<temp.length;i++){
			String key = temp[i][0];
			List<String> tempList = tempMap.get(key);
			if(tempList==null){
				tempList = new ArrayList<String>();
			}
			tempList.add(temp[i][1]);
			tempMap.put(key, tempList);
		}
		
		System.out.println(tempMap);
		System.out.println(tempMap.containsKey("ALL"));
	}
	
	private static void joinByComma() throws IOException {
		BufferedReader br = new BufferedReader(new FileReader("c:\\web\\temp.txt"));
		BufferedWriter bw = new BufferedWriter(new FileWriter("c:\\web\\out.txt"));
		String temp = "";
		while(br.ready()){
			
			String line = br.readLine();
			
			/*if(line!=null&&line.trim().length()>0){
				if(line.trim().length()<10){
					line = "0"+line.trim();
				}
			}*/
			
			if(line!=null&&line.trim().length()>0){
				temp += line.trim() + ",";
			}
		}
		temp = temp.substring(0, temp.length()-1);
		bw.write(temp);
		System.out.println(temp);
		bw.flush();
		br.close();
		bw.close();
	}
	
	public static void testExcludeColumn(){
		String query = "update abc.test set c1 = 1, c2 = 2, c3 =3, c4 =4, c7 =    'A,CB,E' where c5 = 5 and c6 =6";
		ArrayList<String>  excludedColumns = new ArrayList<String>();
		//excludedColumns.add("c7");
		excludedColumns.add("c1");
		excludedColumns.add("c3");
		excludedColumns.add("c2");
		String newQuery = excludeColumnsFromUpdateSQL(query, excludedColumns);
		
				
	}
	
	public static String excludeColumnsFromUpdateSQL(String queryString, List excludedColumnNameList) {
		if ( queryString == null || excludedColumnNameList == null ) {
			return queryString;
		}
		String upperCaseSql = queryString.toUpperCase();
		int whereStartIndex = upperCaseSql.indexOf("WHERE");

		int listSize = excludedColumnNameList.size();
		final String COMMA = ",";
		final String EQUALS = "=";
		final String SINGLEQUOTE = "'";
		int endPos = 0;
		String columnName = null;
		String oneColumnSection = null;
		for (int i = 0; i < listSize; i++ ) {
			columnName =  (String)excludedColumnNameList.get(i);
			int index = upperCaseSql.indexOf( columnName.toUpperCase() );
			if ( index > 0 && index < whereStartIndex ) {
				endPos = queryString.indexOf( COMMA, index );
				endPos =  ( endPos == -1 ? whereStartIndex: endPos + 1 );
				oneColumnSection = queryString.substring(index, endPos);
				queryString = queryString.replaceAll( oneColumnSection, "" );
				upperCaseSql = queryString.toUpperCase();
				whereStartIndex = upperCaseSql.indexOf("WHERE");
			}
		}
		//Remove the comma before the "where" word (if any)
		int lastCommaIndex = queryString.lastIndexOf( COMMA, whereStartIndex -1 );
		if ( lastCommaIndex == -1 ) {
			return queryString;
		}
		oneColumnSection = queryString.substring( lastCommaIndex, whereStartIndex );
		if ( oneColumnSection.indexOf( EQUALS ) == -1 && oneColumnSection.indexOf( SINGLEQUOTE )== -1) {
			queryString = queryString.substring( 0, lastCommaIndex ) + " " + queryString.substring( whereStartIndex );
		}
		return queryString;
	}
	
	private static String createSelectTokenSQL() {
		StringBuffer sb = new StringBuffer(100);
		sb.append(" select distinct rtrim(si.le_no), rtrim(si.company_no), rtrim(si.cust_no), ");
		sb.append(" rtrim(t.status), rtrim(t.country_code), rtrim(decrypt_char(CAST(t.token_no AS VARCHAR(32)), CAST(? AS VARCHAR(27)))) ");
		sb.append(" from eolc.tokens t, EOLC.EOL_SUPP_INFO si ");
		sb.append(" where t.country_code=si.country_code and t.eol_supp_no=si.eol_supp_no and t.status in ('EXP', 'SUB')  and (t.sync_icfs != 'Y' or t.sync_icfs is null) ");
		sb.append(" union ");
		sb.append(" select distinct rtrim(si.le_no), rtrim(si.company_no), rtrim(si.cust_no), ");
		sb.append(" rtrim(t.status), rtrim(t.country_code), rtrim(decrypt_char(CAST(t.token_no AS VARCHAR(32)), CAST(? AS VARCHAR(27)))) ");
		sb.append(" from eolc.tokens t, EOLARCHIVE.EOL_SUPP_INFO si ");
		sb.append(" where t.country_code=si.country_code and t.eol_supp_no=si.eol_supp_no and t.status in ('EXP', 'SUB')  and (t.sync_icfs != 'Y' or t.sync_icfs is null) ");
		sb.append(" order by 5 ");
		return sb.toString();
	}
	
	public static String encryptOptionValue(Double aValue) {
		if (aValue == null)
			return null;

		long noDec = (long) (aValue.doubleValue() * 1000);
		String valStr = String.valueOf(noDec);
		char charArray[] = valStr.toCharArray();

		StringBuffer buf = new StringBuffer();
		for (int i = 0; i < charArray.length; i++) {
			buf.append((char) (charArray[i] + ENCRYPT_KEY + i));
		}
		return buf.toString();
	}
	
	/**
	 * àéèùç ÇÉÀÈï îâäûüë
	 * @param aString
	 * @return
	 */
	public static int getByteLengthOfString(String aString) {
		if ( aString == null ) {
			return 0;
		}
		byte[] bytes = null;
		try {
			bytes = aString.getBytes("UTF-8");
		}
		catch (UnsupportedEncodingException e) {
			bytes = aString.getBytes();
		}
		return bytes.length;
	}
	
	private static void mutliLineStr() throws IOException{
		BufferedReader br = new BufferedReader(new FileReader("c:\\web\\long.txt"));
		while(br.ready()){
			String soapBodyStr = br.readLine();
			if(soapBodyStr!=null&&soapBodyStr.length()>100000){
				int index = 0;
				while(index<soapBodyStr.length()){
					if(index+100000<=soapBodyStr.length()){
						System.out.println("SOAP Body Response="+soapBodyStr.substring(index, index+100000));
						index = index+100000;
					}else{
						System.out.println("SOAP Body Response="+soapBodyStr.substring(index, soapBodyStr.length()));
						index = soapBodyStr.length();
					}
					
				}
			}
		}
	}
	
	private static void mappingColumns() throws IOException {
		BufferedReader br = new BufferedReader(new FileReader("c:\\web\\temp.txt"));
		HashMap<String, ArrayList<String>> mapab = new HashMap<String, ArrayList<String>>();
		while(br.ready()){
			String line = br.readLine();
			if(line!=null&&line.trim().length()>0){
				String[] result = line.split(" ");
				if(result!=null&&result.length==2){
					System.out.println(result[0].trim()+"={"+result[1].trim()+"}");
					ArrayList<String> list = mapab.get(result[0].trim());
					if(list==null){
						list = new ArrayList<String>();
					}
					list.add(result[1].trim());
					mapab.put(result[0].trim(), list);
				}
				
			}
		}
		System.out.println(mapab);
		Set<String> groups = mapab.keySet();
		Iterator<String> it = groups.iterator();
		while(it.hasNext()){
			String key = it.next();
			System.out.println(key+"="+mapab.get(key).size());
		}
		br.close();
	}
	
	private static void sqlIn() throws IOException {
		BufferedReader br = new BufferedReader(new FileReader("c:\\web\\temp.txt"));
		BufferedWriter bw = new BufferedWriter(new FileWriter("c:\\web\\out.txt"));
		String temp = "";
		int i=0;
		while(br.ready()){
			
			String line = br.readLine();
			
			/*if(line!=null&&line.trim().length()>0){
				if(line.trim().length()<10){
					line = "0"+line.trim();
				}
			}*/
			
			if(line!=null&&line.trim().length()>0){
				temp += "'"+line.trim() + "',";
				i++;
				if(i>100000){
					temp = temp.substring(0, temp.length()-1);
					bw.write(temp);
					System.out.println(temp);
					bw.newLine();
					temp = "";
					i=0;
				}
			}
		}
		
		temp = temp.substring(0, temp.length()-1);
		bw.write(temp);
		System.out.println(temp);
		bw.flush();
		br.close();
		bw.close();
	}
	
	private static void joinSQLInOneLine() throws IOException{
		BufferedReader br = new BufferedReader(new FileReader("c:\\web\\sql.txt"));
		BufferedWriter bw = new BufferedWriter(new FileWriter("c:\\web\\out.txt"));
		String temp = "";
		while(br.ready()){
			String line = br.readLine();
			if(line!=null&&line.trim().length()>0){
				if(line.toUpperCase().contains("INSERT INTO EBCC.")){
					if(temp.trim().length()>0){
						temp = temp.concat(";");
						bw.write(temp);
						bw.newLine();
					}
					temp = "";
					
				}
				temp = temp.concat(" ").concat(line.trim());
			}else{
				if(temp!=null&&temp.trim().length()>0){
					temp = temp.concat(";");
					bw.write(temp);
					bw.newLine();
				}
			}
		}
		System.out.println(temp);
		bw.flush();
		br.close();
		bw.close();
	}
	
	private static void joinLinesWithSpaceAtEnd() throws IOException{
		BufferedReader br = new BufferedReader(new FileReader("c:\\web\\temp.txt"));
		BufferedWriter bw = new BufferedWriter(new FileWriter("c:\\web\\out.txt"));
		String temp = "";
		while(br.ready()){
			String line = br.readLine();
			if(line!=null&&line.trim().length()>0){
				temp += line.trim() + " ";
				bw.write(line.trim()+" ");
			}
		}
		System.out.println(temp);
		bw.flush();
		br.close();
		bw.close();
	}
	
	private static void sendMail() {
		String to = "Data.mj9hoy46dntixoo7@u.box.com,Financi.mjjjwo54xk3irqx1@u.box.com,whweiwei@cn.ibm.com";
		String from = "qixin@cn.ibm.com";
	      final String username = "";//change accordingly
	      final String password = "";//change accordingly

	      // Assuming you are sending email through na.relay.ibm.com
	      String host = "na.relay.ibm.com";
	      //host = "cdtrelay.toronto.ca.ibm.com";
	      
	      Properties props = new Properties();
	      props.put("mail.smtp.auth", "true");
	      props.put("mail.smtp.starttls.enable", "false");
	      props.put("mail.smtp.host", host);
	      props.put("mail.smtp.port", "25");

	      // Get the Session object.
	      Session session = Session.getInstance(props,
	         new javax.mail.Authenticator() {
	            protected PasswordAuthentication getPasswordAuthentication() {
	               return new PasswordAuthentication(username, password);
	            }
	         });
	      try {
		         // Create a default MimeMessage object.
		         Message message = new MimeMessage(session);

		         // Set From: header field of the header.
		         message.setFrom(new InternetAddress(from));

		         // Set To: header field of the header.
		         message.setRecipients(Message.RecipientType.TO,
		            InternetAddress.parse(to));

		         // Set Subject: header field
		         String subject = "[PROD]Sending file to BOX";
		         message.setSubject(subject);

		         // Create the message part
		         BodyPart messageBodyPart = new MimeBodyPart();

		         // Now set the actual message
		         String body = subject+"_body";
		         messageBodyPart.setText(body+"\n");
		         
		         // Create a multipart message
		         Multipart multipart = new MimeMultipart();

		         // Set text message part
		         multipart.addBodyPart(messageBodyPart);

		         // Part two is attachment
		         messageBodyPart = new MimeBodyPart();
		         String path = "c:\\databridge\\";
		         String filename = "153804570.zip";
		         String fullPath = path+filename;
		         DataSource source = new FileDataSource(fullPath);
		         messageBodyPart.setDataHandler(new DataHandler(source));
		         messageBodyPart.setFileName(filename);
		         multipart.addBodyPart(messageBodyPart);

		         // Send the complete message parts
		         message.setContent(multipart);

		         // Send message
		         Transport.send(message);

		         System.out.println("Sent file to BOX done!!!");
		  
		      } catch (MessagingException e) {
		    	  e.printStackTrace();
		      }
	}

}
