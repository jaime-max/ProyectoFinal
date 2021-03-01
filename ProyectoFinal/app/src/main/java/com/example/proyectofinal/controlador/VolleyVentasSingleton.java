package com.example.proyectofinal.controlador;

import android.content.Context;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.toolbox.Volley;

public class VolleyVentasSingleton {
    private RequestQueue queue;
    private Context context;
    private static VolleyVentasSingleton miIntancia;

    public VolleyVentasSingleton (Context context){
        this.context = context;
        queue = getRequestQue();
    }

    public RequestQueue getRequestQue(){
        if(queue == null){
            queue = Volley.newRequestQueue(context.getApplicationContext());
        }
        return queue;
    }

    public static synchronized VolleyVentasSingleton getInstance(Context context){
        if(miIntancia == null){
            miIntancia = new VolleyVentasSingleton(context);
        }
        return miIntancia;
    }

    public <T> void addToRequestQue(Request request){
        queue.add(request);
    }
}


