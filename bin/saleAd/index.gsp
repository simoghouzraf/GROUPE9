<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'saleAd.label', default: 'SaleAd')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-saleAd" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                             default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <sec:ifLoggedIn><li><g:link class="create" action="create"><g:message code="default.new.label"
                                                                              args="[entityName]"/></g:link></li></sec:ifLoggedIn>
    </ul>
</div>

<div id="content" role="main">
    <section class="row colset-2-its">
        <div id="list-saleAd" class="content scaffold-list" role="main">
            <h1><g:message code="default.list.label" args="[entityName]"/></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <table>
                <tbody>
                <g:each in="${tp.mbds.com.SaleAd.listOrderByTitle()}" var="saleAd">
                    <tr>
                        <td>
                            <g:if test="${saleAd.illustrations.filename[0]}">
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
                            </g:if>
                            <g:else>
                                <g:link controller="saleAd" action="show" id="${saleAd.id}">
                                    <div style="width: 200px;"></div>
                                </g:link>
                            </g:else>
                        </td>
                        <td>
                            <div class="media-body">
                                <h2>
                                    <g:link controller="saleAd" action="show" id="${saleAd.id}">
                                        ${saleAd.title}
                                    </g:link>
                                </h2>

                                <p>
                                    ${saleAd.price}€ - ${saleAd.author}
                                    <br>
                                    ${saleAd.description}
                                </p>
                            </div>
                        </td>
                    </tr>
                </g:each>
                </tbody>
            </table>

            <div class="pagination">
                <g:paginate total="${saleAdCount ?: 0}"/>
            </div>
        </div>
    </section>
</div>
</body>
</html>