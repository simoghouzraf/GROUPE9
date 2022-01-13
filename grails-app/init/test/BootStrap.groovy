package test

import tp.mbds.com.*

class BootStrap {

    def init = { servletContext ->
        def roleAdmin = new Role(authority: "ROLE_ADMIN").save()
        def roleUser = new Role(authority: "ROLE_USER").save()
        def roleModerator = new Role(authority: "ROLE_MODERATOR").save()

        def userAdmin = new User(username: "admin", password: "admin").save()
        def userClient = new User(username: "user", password: "password").save()
        def userModerator = new User(username: "moderator", password: "mod").save()

        UserRole.create(userAdmin, roleAdmin, true)
        UserRole.create(userClient, roleUser, true)
        UserRole.create(userModerator, roleModerator, true)


        (1..5).each { index ->
            def annonceInstance = new SaleAd(title: "Title " + index,
                    description: "Bored Ape Yacht NFT " + index,
                    longDescription: "The Bored Ape Yacht Club is a collection of 10,000 unique Bored Ape NFTs— unique digital collectibles living on the Ethereum blockchain. Your Bored Ape doubles as your Yacht Club membership card, and grants access to members-only benefits, the first of which is access to THE BATHROOM, a collaborative graffiti board. Future areas and perks can be unlocked by the community through roadmap activation. Visit www.BoredApeYachtClub.com for more details.",
                    price: 100F * index)
            (1..3).each {
                annonceInstance.addToIllustrations(new Illustration(filename: "https://watcher.guru/news/wp-content/uploads/2021/10/Bored-Ape-Yacht-Club-liquidity.jpg"))
            }

            userClient.addToSaleAds(annonceInstance)
        }
        userClient.save(flush: true, failOnError: true)
    }
    def destroy = {
    }
}
