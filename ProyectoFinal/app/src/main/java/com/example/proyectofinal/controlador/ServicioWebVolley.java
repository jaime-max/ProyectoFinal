package com.example.proyectofinal.controlador;

import android.content.Context;

import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.JsonObjectRequest;
import com.example.proyectofinal.modelos.Venta;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

public class ServicioWebVolley {
    String host = "http://localhost:9000/venta/vender/1900823236/12-453-678-34";
    String insertar_url = "/venta/1900823236/5";
    String GET = "obtener_alumnos.php";
    Context context;
    boolean estado;

    List<Venta> listaVenta;

    public ServicioWebVolley(Context context){
        this.context = context;
        listaVenta = new ArrayList<Venta>();
    }

    public boolean vender(Venta venta) throws JSONException {
        String url = host + insertar_url;
        JSONObject json = new JSONObject();
        json.put("fecha","2021-01-29 13:43:23");
        json.put("cantlibros",venta.getCantlibros());
        json.put("descripcion", venta.getDescripcion());
        json.put("date_created","2021-01-29 13:43:23");
        json.put("updated_ac","2021-01-29 13:43:23");

        JsonObjectRequest request = new JsonObjectRequest(
                Request.Method.POST, url, json, new Response.Listener<JSONObject>() {
            @Override
            public void onResponse(JSONObject response) {
                estado = true;
            }
        }, new Response.ErrorListener() {
            @Override
            public void onErrorResponse(VolleyError error) { estado=false;}
        }
        );
        VolleyVentasSingleton.getInstance(context).addToRequestQue(request);
        return estado;
    }

    public  String obtenerVenta(){
        return "";

    }
}
