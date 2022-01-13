<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'saleAd.label', default: 'SaleAd')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
</head>

<body>
<a href="#edit-saleAd" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                             default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="content" role="main">
    <section class="row colset-2-its">
        <div id="edit-saleAd" class="content scaffold-edit" role="main">
            <h1><g:message code="default.edit.label" args="[entityName]"/> ${this.saleAd.id}</h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.saleAd}">
                <ul class="errors" role="alert">
                    <g:eachError bean="${this.saleAd}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                                error="${error}"/></li>
                    </g:eachError>
                </ul>
            </g:hasErrors>
            <g:uploadForm controller="saleAd" action="update" id="${saleAd.id}" method="POST">
                <g:hiddenField name="version" value="${this.saleAd?.version}"/>
                <fieldset class="form">
                    %{--                    <f:all bean="saleAd"/>--}%
                    <div class="form-group required">
                        <label for="title">Title
                            <span class="required-indicator">*</span>
                        </label><input class="form-control" type="text" name="title" value="${this.saleAd.title}"
                                       required="" id="title">
                    </div>

                    <div class="form-group required">
                        <label for="description">Description
                            <span class="required-indicator">*</span>
                        </label><input class="form-control" type="text" name="description"
                                       value="${this.saleAd.description}" required=""
                                       id="description">
                    </div>

                    <div class="form-group required">
                        <label for="longDescription">Long Description
                            <span class="required-indicator">*</span>
                        </label><textarea style="resize: vertical;" class="form-control" type="text"
                                          name="longDescription" required=""
                                          id="longDescription">${this.saleAd.longDescription}</textarea>
                    </div>

                    <div class="form-group">
                        <label for="filename0">Illustration(s)
                            <span class="required-indicator"></span>
                        </label>
                        <g:if test="${this.saleAd.illustrations}">
                            <br>
                            <table>
                                <tbody>
                                <tr>
                                    <g:each in="${this.saleAd.illustrations}" var="saleAd">

                                        <td>
                                            <g:if test="${saleAd.filename.startsWith('https://')}">
                                                <img style="height: 150px;" src="${saleAd.filename}"
                                                     class="d-block w-100" alt="...">
                                            </g:if>
                                            <g:else>
                                                <img style="height: 150px;"
                                                     src="${grailsApplication.config.tpmbds.illustrations.url}${saleAd.filename}"
                                                     class="d-block w-100" alt="...">
                                            </g:else>

                                            <br>
                                            <br>

                                            <div class="media-body">
                                                <g:link class="btn btn-danger" controller="illustration"
                                                        action="delete" id="${saleAd.id}">Supprimer</g:link>
                                            </div>
                                        </td>

                                    </g:each>
                                </tr>
                                </tbody>
                            </table>

                            <div class="content" id="wrapper"></div>
                            <input class="form-control" type="button" id="more_fields" onclick="add_fields();
                            add()" value="Ajouter une illustration">
                        </g:if>
                        <g:else>
                            <input class="form-control" type="file" name="filename0" id="filename0">

                            <br>

                            <div class="content" id="wrapper"></div>

                            <input class="form-control" type="button" id="more_fields" onclick="add_fields();
                            add()" value="Ajouter une illustration">

                        </g:else>
                    </div>

                    <div class="form-group required">
                        <label for="price">Price
                            <span class="required-indicator">*</span>
                        </label><input class="form-control" type="number" name="price" value="${this.saleAd.price}"
                                       required="" min="0.0" id="price">
                    </div>

                    <g:submitButton name="update" class="btn btn-primary" type="submit"
                                    value="${message(code: 'default.button.update.label', default: 'Update')}"/>
                </fieldset>
            </g:uploadForm>
        </div>
    </section>
</div>
<script>
    var i = 1;

    function add() {
        i++;
    }

    function add_fields() {
        document.getElementById('wrapper').innerHTML += '<input class="form-control" type="file" name="filename' + i + '" id="filename' + i + '"><br>\r\n';
    }
</script>
</body>
</html>
