package tp.mbds.com

class SaleAd {

    String title, description, longDescription
    Date dateCreated, lastUpdated
    List illustrations
    Float price

    static hasMany = [illustrations: Illustration]

    static belongsTo = [author: User]

    static constraints = {
        title blank : false, nullable : false
        description blank : false, nullable : false
        longDescription blank : false, nullable : false
        illustrations nullable: true
        price min : 0F
    }

    static mapping = {
        longDescription type : 'text'
        messages lazy: false
    }
}
