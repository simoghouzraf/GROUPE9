<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>

    <asset:stylesheet src="application.css"/>

    <g:layoutHead/>
</head>

<body>

<div class="navbar navbar-default navbar-static-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/tpMBDS">
                <asset:image src="nft-logo.png" alt="Grails Logo"/>
            </a>
        </div>

        <div class="navbar-collapse collapse" aria-expanded="false" style="height: 0.8px;">
            <ul class="nav navbar-nav navbar-right">
                <li class="controller">
                    <g:link controller="saleAd">Annonces</g:link>
                </li>
                <sec:ifLoggedIn>
                    <li class="controller">
                        <g:link controller="saleAd" action="create">Ajouter une annonce</g:link>
                    </li>
                </sec:ifLoggedIn>
                <sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_MODERATOR">
                    <li class="controller">
                        <g:link controller="user">Utilisateurs</g:link>
                    </li>
                </sec:ifAnyGranted>
                <sec:ifAnyGranted roles="ROLE_ADMIN, ROLE_MODERATOR">
                    <li class="controller">
                        <g:link controller="user" action="create">Ajouter un utilisateur</g:link>
                    </li>
                </sec:ifAnyGranted>
                <sec:ifLoggedIn>
                    <li class="controller">
                        <g:link controller="logout">Déconnexion</g:link>
                    </li>
                </sec:ifLoggedIn>
                <sec:ifNotLoggedIn>
                    <li class="controller">
                        <g:link controller="login">Connexion</g:link>
                    </li>
                </sec:ifNotLoggedIn>
            </ul>
        </div>
    </div>
</div>

<g:layoutBody/>

<div class="footer" role="contentinfo">
    <p class="text-center">© Revo NFT <br> Un projet de Mohamed GHOUZRAF & Ayoub MAFKOUD , 26. <br> </p>
</div>

<div id="spinner" class="spinner" style="display:none;">
    <g:message code="spinner.alt" default="Loading&hellip;"/>
</div>

<asset:javascript src="application.js"/>

</body>
</html>
