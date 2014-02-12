<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<jsp:include page="/includes/menu_top.jsp" />
    <body>
    
                    
    <div class="container">    
        <div>
            <form method="get" action="creationProblem">
                <fieldset>
                    <legend>Informations sur le problème</legend>
    
    				<div class="input-group col-lg-3">
                    <input type="text" id="sujet" class="form-control" placeholder="Sujet" name="sujet" value="" size="20" maxlength="20" />
                    </div>
                    <br />
                    
                    <div class="input-group col-lg-3">
                    <input type="textbox" id="details" class="form-control" placeholder="Details" name="details" value="" size="20" maxlength="20" />
                    </div>
                    <br />
    
                    <label for="categorie">Catégorie <span class="requis">*</span></label>
                   <!-- <input type="text" id="categorie" name="categorie" value="" size="20" maxlength="20" /> -->
                    <select class="selectpicker" id="categorie" name="categorie" size="3">
                        <option>Graffiti</option>
                        <option>Toilettes publiques</option>
                        <option>Feux de signalisation</option>
                    </select>                    
                    <br />
    
                    <label for="photo">Photo <span class="requis">*</span></label>
                    <!-- <input type="text" id="telephoneClient" name="telephoneClient" value="" size="20" maxlength="20" /> -->
                    <input type="file" id="photo" name="photo" value="" width="20" />
                    <br />
                    
                    <div class="input-group col-lg-3">
                    	<span class="input-group-addon">@</span>
                    	<input type="email" id="email" class="form-control" placeholder="Email" name="email" value="" size="20" />                    	                    	
                    </div>
                    <br />
                    
                    <div class="input-group col-lg-3">                    
                    <input type="text" id="nom" class="form-control" placeholder="Nom" name="nom" value="" size="20" maxlength="20" />                    
                    </div>
                    <br />
                    
                    <div class="input-group col-lg-3">                    
                    <input type="text" id="telephone" class="form-control" placeholder="Telephone" name="telephone" value="" size="20" maxlength="20" />                    
                    </div>
                    <br />
                    
                </fieldset>
                <input type="submit" value="Valider"  />
                <input type="reset" value="Reinitialiser" /> <br />
            </form>
        </div>
       </div>       
    </body>
</html>