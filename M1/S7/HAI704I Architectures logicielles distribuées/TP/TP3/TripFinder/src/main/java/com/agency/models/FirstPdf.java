package com.agency.models;
import java.util.Date;

import com.itextpdf.text.Anchor;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Font;
import com.itextpdf.text.List;
import com.itextpdf.text.ListItem;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Section;



public class FirstPdf {
    public static String FILE = System.getProperty("user.dir") +"/Reservation.pdf";
    public static Font catFont = new Font(Font.FontFamily.TIMES_ROMAN, 18,
            Font.BOLD);
    public static Font redFont = new Font(Font.FontFamily.TIMES_ROMAN, 12,
            Font.NORMAL, BaseColor.RED);
    public static Font subFont = new Font(Font.FontFamily.TIMES_ROMAN, 16,
            Font.BOLD);
    public static Font smallBold = new Font(Font.FontFamily.TIMES_ROMAN, 12,
            Font.BOLD);

    // iText allows to add metadata to the PDF which can be viewed in your Adobe
    // Reader
    // under File -> Properties
    public static void addMetaData(Document document) {
        document.addTitle("Reservation");

    }

    public static void addTitlePage(Document document,Hotel hotel, String client, Reservation resa)
            throws DocumentException {
        Paragraph preface = new Paragraph();
        // We add one empty line
        addEmptyLine(preface, 1);
        // Lets write a big header
        preface.add(new Paragraph("Thank you for your purchase "+ client + " !", catFont));
        addEmptyLine(preface, 1);
        preface.add(new Paragraph("Your order have been placed", catFont));
        addEmptyLine(preface, 1);

        // Will create: Report generated by: _name, _date
        preface.add(new Paragraph(
                "Reservation made by: " + client +", on " + new Date(), //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
                smallBold));
        addEmptyLine(preface, 1);
        preface.add(new Paragraph(
                "Please find in this document the information concerning your purchase on " ,//+ agency.getAgencyName(),
                smallBold));

        addEmptyLine(preface, 2);

        preface.add(new Paragraph(
                "Payment infos: ",smallBold));
        
        addEmptyLine(preface, 1);

        preface.add(new Paragraph(
                "Amount: " + resa.getRoom().getPrice() +"€",smallBold));
        
        addEmptyLine(preface, 1);

        preface.add(new Paragraph(
                "Hotel: " + hotel.getName() + " | " + String.valueOf(hotel.getStars()) + " stars | " +hotel.getAddress().toString(),smallBold));
        
        String gps = "";
        try {
        	gps = GPSMaker.gpsEncoder(hotel.getAddress().toString());
        } catch (Exception exc) {
        	exc.printStackTrace();
        }
        String link = "";
        if(gps !=null) {
        	String[] arr = gps.split(" ");
        	link = "http://maps.google.com/maps?z=12&t=m&q=loc:" + arr[0] + "+" + arr[1];
        }
        
        Anchor anchor = new Anchor("CLick here to see the hotel on Google Maps");
        anchor.setReference(link);
        Paragraph par = new Paragraph("", smallBold);
        
        par.add(anchor);
        preface.add(par);

        preface.add(new Paragraph(
        		"Room n°"+ resa.getRoom().getRoomNumber() + " | Arrival date: " + resa.getIn().toString() + " | Departure date: " + resa.getOut().toString(), smallBold
        		));
        document.add(preface);
        // Start a new page
        document.newPage();
    }



    public static void createList(Section subCatPart) {
        List list = new List(true, false, 10);
        list.add(new ListItem("First point"));
        list.add(new ListItem("Second point"));
        list.add(new ListItem("Third point"));
        subCatPart.add(list);
    }

    public static void addEmptyLine(Paragraph paragraph, int number) {
        for (int i = 0; i < number; i++) {
            paragraph.add(new Paragraph(" "));
        }
    }
}