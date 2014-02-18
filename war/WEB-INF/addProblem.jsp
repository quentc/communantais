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
              			<textarea class="form-control" id="details" placeholder="Details" name="details" rows="3"></textarea>
          			</div>
          			 <br />
          
    
                    <label for="categorie">Catégorie</label>
                    <div class="input-group col-lg-3">
                    <select class="form-control" id="categorie" name="categorie">
                        <option>Graffiti</option>
                        <option>Toilettes publiques</option>
                        <option>Feux de signalisation</option>
                    </select> 
                    </div>                   
                    <br />
    
                    <label for="photo">Photo</label>
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