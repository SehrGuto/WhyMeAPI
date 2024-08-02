-- Ingresar datos a la entidad "Users"
INSERT INTO Users (Name, LastName, Age, Email, Description) VALUES
('J', 'Balvin', 39, 'balvin@gmail.com', 'Mi perro se escapó'),
('Karol', 'G', 33, 'karol@gmail.com', 'Perdi mi vuelo'),
('Tego', 'Calderón', 52, 'tego@gmail.com.com', 'Mi laptop se daño y perdi mis canciones'),
('Checho', 'Corleone', 45, 'checho@gmail.com', 'Se me pinchó una llanta camino al party'),
('Farina', 'La Chica Más Fina', 37, 'farina@gmail.com', 'Mi ex me robó la billetera');

-- Ingresar datos a la entidad "Pasts"
INSERT INTO Pasts (Action) VALUES
('Dejaste la toalla mojada en la cama'),
('Te olvidaste de comprar leche'),
('No regaste las plantas por una semana'),
('Pisaste un chicle en la calle'),
('Olvidaste cerrar la ventana antes de salir'),
('No contestaste una llamada importante'),
('Dejaste las llaves dentro del coche'),
('Te saltaste el desayuno'),
('No pusiste el despertador'),
('Tiraste accidentalmente sal en la mesa'),
('Cruzaste bajo una escalera'),
('Rompiste un espejo sin querer'),
('No devolviste un libro a la biblioteca'),
('Pasaste por debajo de un gato negro'),
('Olvidaste felicitar a un amigo por su cumpleaños'),
('No cerraste bien el grifo del baño'),
('Dejaste comida en el microondas'),
('Te olvidaste de poner el freno de mano'),
('No apagaste la luz al salir de casa'),
('Pisaste una hormiga sin darte cuenta'),
('Olvidaste sacar la basura'),
('No cerraste la puerta del refrigerador completamente'),
('Dejaste ropa en la lavadora por días'),
('No cambiaste la contraseña como te recomendaron'),
('Olvidaste poner el móvil a cargar'),
('Dejaste los platos sucios en el fregadero'),
('No devolviste un saludo en la calle'),
('Olvidaste guardar un archivo importante'),
('No limpiaste las migas de la mesa'),
('Dejaste el paraguas en un taxi'),
('No revisaste el correo por varios días'),
('Olvidaste poner el tapón de la gasolina'),
('No apagaste la computadora antes de irte'),
('Dejaste una ventana abierta durante una tormenta'),
('Olvidaste ponerle agua al perro'),
('No cerraste bien la puerta al salir'),
('Dejaste el cepillo de dientes fuera del vaso'),
('Olvidaste firmar un documento importante'),
('No pusiste el celular en modo silencioso en el cine'),
('Dejaste las luces del coche encendidas toda la noche');

-- Ingresar datos a la entidad "Results"
INSERT INTO Results (userId, pastId, reason)
SELECT 
    Users.id AS userId,
    Pasts.id AS pastId,
    Pasts.Action AS reason
FROM 
    Users
CROSS JOIN (
    SELECT id, Action, ROW_NUMBER() OVER (ORDER BY RANDOM()) AS rn
    FROM Pasts
) AS Pasts
WHERE
    Pasts.rn = (Users.id % (SELECT COUNT(*) FROM Pasts)) + 1
ORDER BY 
    RANDOM();

-- Inner Join para filtrar quien, que pasó y porque pasó
SELECT Users.Name as nombre, Users.Description as que_paso, Results.Reason as fue_porque
FROM Results
INNER JOIN Users ON Results.UserId = Users.Id
INNER JOIN Pasts ON Results.PastId = Pasts.Id;

-- Left Join para filtrar quien y porque le pasó lo que le pasó
SELECT Users.Name, Results.Reason
FROM Users
LEFT JOIN Results ON Users.Id = Results.UserId;

-- Union, perdón por esa, no logré pensar en una unión que me regresará datos relevantes
SELECT Name FROM Users
UNION
SELECT Action FROM Pasts;

-- Case, para verificar que los usuarios sean mayores de edad
SELECT Name,
    CASE
        WHEN Age < 18 THEN 'Minor'
        WHEN Age BETWEEN 18 AND 65 THEN 'Adult'
        ELSE 'Senior'
    END AS AgeGroup
FROM Users;