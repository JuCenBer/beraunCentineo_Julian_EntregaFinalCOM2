package logica;

import java.util.Date;
import java.util.List;
import persistencia.ControladoraPersistencia;
import persistencia.ServicioJpaController;

public class Controladora {
    
    ControladoraPersistencia controlPersis = new ControladoraPersistencia();

    public void crearEmpleado(String nombre, String apellido, Date fecha_nac, String direccion, String dni, String cargo, double sueldo, int celular, String email, String nacionalidad, String nombreUsu, String contrasenia) {
        Empleado emple = new Empleado();
        Usuario usu = new Usuario();
        
        
        emple.setNombre(nombre);
        emple.setApellido(apellido);
        emple.setDireccion(direccion);
        emple.setNacionalidad(nacionalidad);
        emple.setCargo(cargo);
        emple.setSueldo(sueldo);
        emple.setCelular(celular);
        emple.setDni(dni);
        emple.setFecha_nac(fecha_nac);
        emple.setEmail(email);
        
        usu.setNombreUsu(nombreUsu);
        usu.setContrasenia(contrasenia);
        
        emple.setUsu(usu);
        
        controlPersis.crearEmpleado(emple,usu);
    }   
    
    public List<Empleado> traerEmpleados(){
        return controlPersis.traerEmpleados();
    }

    public void borrarEmpleado(int id) {
        controlPersis.borrarEmpleado(id);
    }
    
    public Empleado buscarEmpleado(int id) {
        return controlPersis.buscarEmpleado(id);
    }
    
    public void modificarEmpleado(Empleado emple) {
        controlPersis.modificarEmpleado(emple);
    }
    
    //CLIENTE
    public void crearCliente(String nombre, String apellido, Date fecha_nac, String direccion, String dni, int celular, String email, String nacionalidad) {
        Cliente cli = new Cliente();
        
        cli.setNombre(nombre);
        cli.setApellido(apellido);
        cli.setFecha_nac(fecha_nac);
        cli.setDireccion(direccion);
        cli.setDni(dni);
        cli.setCelular(celular);
        cli.setEmail(email);
        cli.setNacionalidad(nacionalidad);
        
        controlPersis.crearCliente(cli);
    }
    
    public Cliente buscarCliente(int id){
        return controlPersis.buscarCliente(id);
    }

    public List<Cliente> traerClientes(){
        return controlPersis.traerClientes();
    }
    
    public void borrarCliente(int id){
        controlPersis.borrarCliente(id);
    }
    
    public void modificarCliente(Cliente cli) {
        controlPersis.modificarCliente(cli);
    }
    //SERVICIOS
    public void crearServicio(String nombre, String descripcion_breve, String destino_servicio, Date fecha_servicio, double costo_servicio) {
        Servicio ser = new Servicio();
        ser.setNombre(nombre);
        ser.setDescripcion_breve(descripcion_breve);
        ser.setDestino_servicio(destino_servicio);
        ser.setFecha_servicio(fecha_servicio);
        ser.setCosto_servicio(costo_servicio);
        controlPersis.crearServicio(ser);
    }
    
    public Servicio buscarServicio(int id){
        return controlPersis.buscarServicio(id);
    }
    public List<Servicio> traerServicios(){
        return controlPersis.traerServicios();
    }
    public void borrarServicio(int id){
        controlPersis.borrarServicio(id);
    }
    public void modificarServicio(Servicio ser){
        controlPersis.modificarServicio(ser);
    }
    
    
    //PAQUETES
    public void crearPaquete(Paquete paq){
        controlPersis.crearPaquete(paq);
    }
    public List<Paquete> traerPaquetes() {
        return controlPersis.traerPaquetes();
    }
    public void borrarPaquete(int id){
        controlPersis.borrarPaquete(id);
    }
    public void modificarPaquete(Paquete paq){
        controlPersis.modificarPaquete(paq);
    }
    public Paquete buscarPaquete(int id) {
        return controlPersis.buscarPaquete(id);
    }
    //VENTAS

    public void crearVenta(Venta ven) {
        controlPersis.crearVenta(ven);
    }
    public List<Venta> traerVentas() {
        return controlPersis.traerVentas();
    }
    public void borrarVenta(int id){
        controlPersis.borrarVenta(id);
    }
    public void modificarVenta(Venta ven){
        controlPersis.modificarPaquete(ven);
    }
    public Venta buscarVenta(int id) {
        return controlPersis.buscarVenta(id);
    }

    //USUARIO   
    public boolean verificarUsuario(String usuario, String contrasenia) {
        List<Usuario> listaUsuarios = controlPersis.traerUsuarios();
        if(listaUsuarios != null){
             for (Usuario usu: listaUsuarios) {
                 if ((usu.getNombreUsu().equals(usuario)) && (usu.getContrasenia().equals(contrasenia))){
                    return true;
                }
            }
        } 
        return false;
    }

    public void modificarUsuario(Usuario usu) {
        controlPersis.modificarUsuario(usu);
    }
    

    

    

    
}

