package myblogapp

class Blog {

    Date createdDate = new Date()
    String title
    String description
    Image image
    User user

    static constraints = {
        description type: 'text'
    }
}
