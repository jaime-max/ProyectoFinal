package com.example.proyectofinal;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.RecyclerView;

import com.example.proyectofinal.controlador.ServicioWebVolley;
import com.example.proyectofinal.modelos.Venta;

import org.json.JSONException;

public class ActivityVolleyVenta  extends AppCompatActivity {
    EditText cajaCantidad, cajaDescripcion;
    Button botonVender;
    TextView datos;
    RecyclerView recyclerViewVenta;

    ServicioWebVolley servicio;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_volley_venta);
        cargarComponentes();
        botonVender.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Venta venta = new Venta();
                venta.setCantlibros(Integer.parseInt(cajaCantidad.getText().toString()));
                venta.setDescripcion(cajaDescripcion.getText().toString());
                try {
                    boolean estado = servicio.vender(venta);
                    if (estado){
                        Toast.makeText(ActivityVolleyVenta.this, "Vneta Registrada", Toast.LENGTH_SHORT).show();
                    }else{
                        Toast.makeText(ActivityVolleyVenta.this, "Venta No Registrada", Toast.LENGTH_SHORT).show();
                    }
                }catch (JSONException e){
                    e.printStackTrace();
                }
            }
        });
    }

    private void cargarComponentes(){
        cajaCantidad = findViewById(R.id.txtIdCantidadVolley);
        cajaDescripcion = findViewById(R.id.txtIDescripcionVolley);
        botonVender = findViewById(R.id.btnVenderVolly);
        datos = findViewById(R.id.lblDatosVentaVolly);
        recyclerViewVenta = findViewById(R.id.recyclerVentaVolly);
    }

}
