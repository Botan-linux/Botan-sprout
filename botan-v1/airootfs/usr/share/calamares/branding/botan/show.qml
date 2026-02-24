import QtQuick 2.0
import calamares.slideshow 1.0

Presentation {
    id: presentation  // Id ekledik

    Timer {
        interval: 5000; running: true; repeat: true
        // 'parent.nextSlide()' yerine 'presentation.goToNextSlide()' kullanıyoruz
        onTriggered: presentation.goToNextSlide() 
    }

    Slide {
        anchors.fill: parent
        Text { 
            text: "Botan Linux'a Hoş Geldiniz!"
            anchors.centerIn: parent
            font.pointSize: 20
            color: "#00ff88" 
        }
    }

    Slide {
        anchors.fill: parent
        Text { 
            text: "Gelecek Botan ile büyüyecek..."
            anchors.centerIn: parent
            font.pointSize: 20
            color: "#ffffff" 
        }
    }
}
