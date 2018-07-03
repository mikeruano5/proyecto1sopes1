/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;

import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.Consumes;
import javax.ws.rs.Produces;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PUT;
import javax.ws.rs.POST;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

/**
 * REST Web Service
 *
 * @author scxal
 */
@Path("get")
public class GetResource {

    @Context
    private UriInfo context;

    /**
     * Creates a new instance of GetResource
     */
    public GetResource() {
    }

    /**
     * Retrieves representation of an instance of logica.GetResource
     * @return an instance of java.lang.String
     */
    @GET
    public String getXml() {
        //TODO return proper representation object
        SEND nuevo = new SEND();
        String get = nuevo.send("get", "rpc_queue1");
        nuevo.close();
        return get;
        //throw new UnsupportedOperationException();
    }

    /**
     * PUT method for updating or creating an instance of GetResource
     * @param content representation for the resource
     */
    @PUT
    @Consumes(MediaType.APPLICATION_XML)
    public void putXml(String content) {
        System.out.println(content);
    }
    
    @POST
    public Response postXml(String content) {
        System.out.println(content);
        SEND nuevo = new SEND();
        nuevo.send(content, "rpc_queue1");
        nuevo.close();
        return Response.ok().build();
    }
}
