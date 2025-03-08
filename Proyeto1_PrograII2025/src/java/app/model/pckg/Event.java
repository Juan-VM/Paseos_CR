package app.model.pckg;

public class Event {

    public int id;
    public String name;
    public String description;
    public String date;
    public String photo;
    public String ubication;
    public int ticketsAvailable;

    public Event() {
    }

    public Event(int id, String name, String description, String date, String photo, String ubication, int ticketsAvailable) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.date = date;
        this.photo = photo;
        this.ubication = ubication;
        this.ticketsAvailable = ticketsAvailable;
    }

}
