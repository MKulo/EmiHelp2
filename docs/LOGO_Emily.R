# Koordinatensystem erstellen
plot(0, 0, type = "n", xlim = c(-10, 10), ylim = c(-10, 10),
     xlab = "X-Achse", ylab = "Y-Achse", main = "Turtle-Muster im Koordinatensystem")
grid(nx = NULL, ny = NULL, col = "gray", lty = 2)
abline(h = 0, v = 0, col = "black", lwd = 2)

# Funktion für Turtle-Bewegung
move_turtle <- function(x, y, angle, distance) {
  new_x <- x + distance * cos(angle * pi / 180)
  new_y <- y + distance * sin(angle * pi / 180)
  return(c(new_x, new_y))
}

# Startposition und -winkel
x <- 0
y <- 0
angle <- 0 

# Hauptschleife (REPEAT 20)
for (i in 1:20) {
  # Innere Schleife (REPEAT 180)
  for (j in 1:180) {
    # Bewegung berechnen (FD 1)
    new_pos <- move_turtle(x, y, angle, 0.05)  # Skaliert auf 0.05 für bessere Sichtbarkeit
    
    # Linie zeichnen
    lines(c(x, new_pos[1]), c(y, new_pos[2]), col = "blue")
    
    # Position aktualisieren
    x <- new_pos[1]
    y <- new_pos[2]
    
    # Drehung (RT 2)
    angle <- (angle + 2) %% 360
  }
  
  # Äußere Drehung (RT 18)
  angle <- (angle + 18) %% 360
}