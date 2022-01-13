<%@ page import="tp.mbds.com.SaleAd" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Welcome to Grails</title>
</head>

<body>
%{--${grailsApplication.config.tpmbds.illustrations.url}nom_image.png--}%
<div id="content" role="main">
    <section class="row colset-2-its">
        <div id="controllers" role="navigation">
            <h1>Annonces récentes</h1>
            <table>
                <tbody>
                <g:each in="${tp.mbds.com.SaleAd.list()}" var="saleAd">
                    <tr>
                        <td>
                            <g:link controller="saleAd" action="show" id="${saleAd.id}">
                                <g:if test="${saleAd.illustrations.filename[0].startsWith('https://')}">
                                    <img style="width: 200px;" src="${saleAd.illustrations.filename[0]}"
                                         class="d-block w-100" alt="...">
                                </g:if>
                                <g:else>
                                    <img style="width: 200px;"
                                         src="${grailsApplication.config.tpmbds.illustrations.url}${saleAd.illustrations.filename[0]}"
                                         class="d-block w-100" alt="...">
                                </g:else>
                            </g:link>
                        </td>
                        <td>
                            <div class="media-body">
                                <h2>
                                    <g:link controller="saleAd" action="show" id="${saleAd.id}">
                                        ${saleAd.title}
                                    </g:link>
                                </h2>

                                <p>
                                    ${saleAd.price}€
                                    <br>
                                    ${saleAd.description}
                                </p>
                            </div>
                        </td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
    </section>
</div>

</body>
</html>
