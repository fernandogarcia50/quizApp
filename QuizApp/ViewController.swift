//
//  ViewController.swift
//  QuizApp
//
//  Created by Mac11 on 07/03/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var puntajeLbl: UILabel!
    @IBOutlet weak var puntajeLabel: UILabel!
    @IBOutlet weak var preguntaLabel: UILabel!
    var valorBarra:Float=0.0
    @IBOutlet weak var barraProgreso: UIProgressView!
    @IBOutlet weak var falseBtn: UIButton!
    @IBOutlet weak var verdaderoBtn: UIButton!
    let preguntas=[Pregunta(Texto: "CO2 es dióxido de carbono", Respuesta: "VERDADERO"),Pregunta(Texto: "Colombia limita con Ecuador, Surinam, Bolivia y Perú", Respuesta: "FALSO"),Pregunta(Texto: "Todas las palabras agudas llevan tilde", Respuesta: "FALSO"),Pregunta(Texto: "Morelia es la capital de Michoacán", Respuesta: "VERDADERO"),Pregunta(Texto: "1+1=3", Respuesta: "FALSO"),Pregunta(Texto: "Mèxico està en el continente Europeo", Respuesta: "FALSO"),Pregunta(Texto: "El siguiente mundial es en 2023", Respuesta: "FALSO"),Pregunta(Texto: "Estados Unidos es una potencia mundial", Respuesta: "VERDADERO"),Pregunta(Texto: "Michoacàn es un estado perteneciente a Rusia", Respuesta: "FALSO"),Pregunta(Texto: "Verazruz colinda con Durando", Respuesta: "FALSO")]
    //let preguntas=[["CO2 es dióxido de carbono","VERDADERO"],["Colombia limita con Ecuador, Surinam, Bolivia y Perú","FALSO"],["Todas las palabras agudas llevan tilde","FALSO"]]
    var numeroPregunta=0
    var correctas:Int=0
    override func viewDidLoad() {
        super.viewDidLoad()
        cambiarPregunta()
    }

    @IBAction func respuestaVBtn(_ sender: UIButton) {
        let respuestaUsuario=sender.currentTitle
        let respuestaVerdadera=preguntas[numeroPregunta].Respuesta
        if respuestaUsuario==respuestaVerdadera {
            sender.backgroundColor=UIColor.green
            correctas+=1
            print("si le atine")
        }else{
            sender.backgroundColor=UIColor.red
            print("no le atine")
        }
        if numeroPregunta+1<preguntas.count {
            
            numeroPregunta+=1
            
        }else{
            alerta()
            //numeroPregunta=0
           
        }
        Timer.scheduledTimer(timeInterval: 1.3, target: self, selector: #selector(cambiarPregunta), userInfo: nil, repeats: false)
    
    }
    @objc func cambiarPregunta()  {
        print(numeroPregunta)
        falseBtn.backgroundColor=UIColor.white
        verdaderoBtn.backgroundColor=UIColor.white
        preguntaLabel.text=preguntas[numeroPregunta].Texto
        puntajeLbl.text="Puntaje: \(correctas)"
        valorBarra=Float(numeroPregunta+1)/Float(preguntas.count)
        print(valorBarra)
        barraProgreso.progress=valorBarra
    }
    func alerta() {
        let alerta=UIAlertController(title: "Test Terminado", message: "Tu puntaje final es de: \(correctas)", preferredStyle: .alert)
        let accion=UIAlertAction(title: "Jugar de nuevo", style: .default) { [self] (_) in
            self.numeroPregunta=0
            self.correctas=0
            cambiarPregunta()
        }
        let cerrar=UIAlertAction(title: "Salir", style: .destructive) { (_) in
            print("estoy saliendo")
            exit(0)
        }
        alerta.addAction(accion)
        alerta.addAction(cerrar)
        present(alerta, animated: true, completion: nil)
    }
    
}

