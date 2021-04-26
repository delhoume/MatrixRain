#include <TFT_eSPI.h>
#include <SPI.h>
#include "DigitalRainAnim.h"

TFT_eSPI tft = TFT_eSPI();
DigitalRainAnim digitalRainAnim = DigitalRainAnim(); 
 
void setup() {
  Serial.begin(115200);
//  SPIFFS.begin();
//  listFiles(); // Lists the files so you can see what is in the SPIFFS

  tft.begin();
  tft.setRotation(2);
  tft.fillScreen(TFT_BLACK);
  digitalRainAnim.init(&tft);
}

void loop() {
  digitalRainAnim.loop();
}
