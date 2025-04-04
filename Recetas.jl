function mostrar_menu()
    println("--- Menú de la Perrera ---")
    println("1. Agregar perro")
    println("2. Mostrar perros")
    println("3. Actualizar salud de perro")
    println("4. Salir")
end

function obtener_opcion()
    while true
        try
            println("Elige una opción:")
            opcion = parse(Int, readline())  # Esto convierte la entrada a un número entero
            if opcion in 1:4  # Verifica si la opción es válida
                return opcion
            else
                println("Por favor, ingresa un número entre 1 y 4.")
            end
        catch e
            println("Por favor, ingresa un número válido.")
        end
    end
end

# Lista para almacenar los perros
perrera = []

function agregar_perro()
    println("Ingrese el nombre del perro:")
    nombre = readline()
    
    println("Ingrese la raza del perro:")
    raza = readline()
    
    println("Ingrese la edad del perro:")
    edad = parse(Int, readline())  # Convierte la entrada a entero
    
    println("Ingrese el estado de salud del perro (bueno/malo):")
    salud = readline()
    
    # Crear un perro (puedes almacenar como un diccionario o una estructura simple)
    perro = Dict("nombre" => nombre, "raza" => raza, "edad" => edad, "salud" => salud)
    
    # Agregar el perro a la perrera
    push!(perrera, perro)
    
    println("Perro agregado exitosamente.")
end

function mostrar_perros()
    if isempty(perrera)
        println("No hay perros en la perrera.")
    else
        println("Perros en la perrera:")
        for (i, perro) in enumerate(perrera)
            println("Perro $i: Nombre: $(perro["nombre"]), Raza: $(perro["raza"]), Edad: $(perro["edad"]), Salud: $(perro["salud"])")
        end
    end
end

function actualizar_salud()
    if isempty(perrera)
        println("No hay perros en la perrera.")
        return
    end
    
    println("Elige el número del perro al que deseas actualizarle la salud:")
    for (i, perro) in enumerate(perrera)
        println("$i: Nombre: $(perro["nombre"])")
    end
    
    while true
        try
            opcion = parse(Int, readline())  # Elige el perro a actualizar por número
            if opcion >= 1 && opcion <= length(perrera)
                perro = perrera[opcion]
                println("El estado de salud actual de $(perro["nombre"]) es: $(perro["salud"])")
                println("Ingrese el nuevo estado de salud (bueno/malo):")
                nuevo_estado = readline()
                perro["salud"] = nuevo_estado
                println("Salud de $(perro["nombre"]) actualizada a $nuevo_estado.")
                return
            else
                println("Por favor, ingresa un número válido del perro.")
            end
        catch e
            println("Por favor, ingresa un número válido.")
        end
    end
end

# Función principal
function menu()
    while true
        mostrar_menu()
        opcion = obtener_opcion()
        
        if opcion == 1
            agregar_perro()
        elseif opcion == 2
            mostrar_perros()
        elseif opcion == 3
            actualizar_salud()
        elseif opcion == 4
            println("¡Hasta luego!")
            break
        end
    end
end

# Iniciar el programa
menu()
