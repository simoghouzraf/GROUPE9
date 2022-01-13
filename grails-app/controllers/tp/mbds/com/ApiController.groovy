package tp.mbds.com

import grails.converters.JSON
import grails.converters.XML
import org.apache.commons.lang.RandomStringUtils


class ApiController {

    def index() { }

    def saleAd() {
        switch(request.getMethod()) {
            case "GET":
                if (!params.id)
                    return response.status = 400
                def saleAdInstance = SaleAd.get(params.id)
                if (!saleAdInstance){
                    return response.status = 404
                }
                response.withFormat {
                    xml { render saleAdInstance as XML}
                    json { render saleAdInstance as JSON }
                }
                break
            case "PUT":
                if (!params.id)
                    return response.status = 400
                def saleAdInstance = SaleAd.get(params.id)
                if (!saleAdInstance)
                    return response.status = 404

                def title = request.JSON.title
                saleAdInstance.title = title

                def description = request.JSON.description
                saleAdInstance.description = description

                def longDescription = request.JSON.longDescription
                saleAdInstance.longDescription = longDescription

                def price = request.JSON.price
                saleAdInstance.price = price

                saleAdInstance.save(flush :true)

                response.withFormat {
                    xml { render saleAdInstance as XML }
                    json { render saleAdInstance as JSON }
                }
                break
            case "DELETE":
                if (!params.id)
                    return response.status = 400
                def saleAdInstance = SaleAd.get(params.id)
                if (!saleAdInstance)
                    return response.status = 404
                def userInstance = saleAdInstance.author
                userInstance.removeFromSaleAds(saleAdInstance)
                saleAdInstance.delete(flush : true)
                return response.status = 200
            default:
                return response.status = 405
                break
        }
        return response.status = 406


    }

    def saleAds() {
        switch(request.getMethod()) {
            case "GET":


                def saleAdlist = SaleAd.getAll()
                if (saleAdlist.isEmpty())
                    return response.status = 404
                response.withFormat {
                    xml { render saleAdlist as XML }
                    json { render saleAdlist as JSON }
                }
                break
        case "POST":
                def saleAdInstance = new SaleAd(title: request.JSON.title,
                        description: request.JSON.description,
                        longDescription: request.JSON.longDescription,
                        price: request.JSON.price)
// Recup les données base 64 de ta request
                def filedata = request.JSON.filename
// Créer un fichier mémoire à base de ces données base 64
                byte[] decoded = filedata.decodeBase64()
// Ajouter une random string
                String charset = (('A'..'Z') + ('0'..'9')).join()
                Integer length = 9
                String randomString = RandomStringUtils.random(length, charset.toCharArray())
// Sauvegarde sur ton systeme de fichier
                def file =new File(grailsApplication.config.tpmbds.illustrations.path + randomString +'.png')
                file.withOutputStream {
                    it.write decoded
                }
                saleAdInstance.addToIllustrations(new Illustration(filename: file.getName()  ))
                def userInstance = User.get(request.JSON.author)
                userInstance.addToSaleAds(saleAdInstance)
                if (!userInstance.save(flush: true))
                    return response.status = 400

                response.withFormat {
                    xml { render saleAdInstance as XML }
                    json { render saleAdInstance as JSON }
                }
                return response.status =201
                break
            default:
                return response.status= 405
                break
        }
        return response.status = 406
    }

    def user(){
        switch (request.getMethod()) {
            case "GET":
                if (!params.id)
                    return response.status = 400
                def userInstance = User.get(params.id)
                if (!userInstance)
                    return response.status = 404
                response.withFormat {
                    xml { render userInstance as XML }
                    json { render userInstance as JSON }
                }
                break
            case "PUT":
                if (!params.id)
                    return response.status = 400
                def userInstance = User.get(params.id)
                if (!userInstance)
                    return response.status = 404
                /*changement username*/

                def username = request.JSON.username
                userInstance.username=username
                /*changement password*/
                def password = request.JSON.password
                if (password!= userInstance.password)
                    userInstance.password=password

                userInstance.save(flush:true)
                response.withFormat {
                    xml { render userInstance as XML }
                    json { render userInstance as JSON }
                }

                break
            case "DELETE":
                if (!params.id)
                    return response.status = 400
                def userInstance = User.get(params.id)
                if (!userInstance)
                    return response.status = 404

                UserRole.removeAll(userInstance)
                userInstance.delete(flush: true)

                return response.status = 200

                break
            default:
                return response.status= 405
                break
        }
        return response.status= 406
    }

    def users() {
        switch(request.getMethod()) {
            case "GET":


                def userlist = User.getAll()
                if (userlist.isEmpty())
                    return response.status = 404
                response.withFormat {
                    xml { render userlist as XML }
                    json { render userlist as JSON }
                }
                break
            case "POST":

                def userInstance = new User(username :request.JSON.username, password : request.JSON.password)
                if(!userInstance.save(flush:true))
                    return response.status = 400
                userInstance.save(flush:true)
                def role = Role.get(request.JSON.role)
                UserRole.create(userInstance,role,true)
                response.withFormat {
                    xml { render userInstance as XML }
                    json { render userInstance as JSON }
                }
                break
            default:
                return response.status= 405
                break


        }
        return response.status = 406

    }
}
