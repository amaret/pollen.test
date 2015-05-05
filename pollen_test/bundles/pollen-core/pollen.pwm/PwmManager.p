package pollen.pwm

import PwmChannel

from pollen.time import Timer

module PwmManager {
  
  const uint16 MaxPwmPeriodHz = 1000
  host uint8 numChannels = 1
  PwmChannel channels[numChannels] = {null}
  host new Timer pwmTimer(pwmTick)
  bool active = false;
  uint16 periodHz = 0

  PwmManager() { }

  host PwmManager() {  
    numChannels = 0       // only true if no one calls registerChannelOnHost
  }

  public host registerChannelOnHost() {
    numChannels += 1
    print "PwmManager new channel total=" + numChannels + "\n"
  }

  public host setPwmPeriodOnHost(uint16 hz) {    
    if (hz > MaxPwmPeriodHz) { return }
    if ((1000 % hz) != 0) {         // set to the closest highest factor of 1000
      while ((1000 % hz) != 0) {
        ++hz
      }
    }
    periodHz = hz
    print "PwmManager set period to " + periodHz + "HZ" + "\n"
  }

  public setPwmPeriod(uint16 hz) {
    if (hz > MaxPwmPeriodHz) { return }
    if ((1000 % hz) != 0) {         // set to the closest highest factor of 1000
      while ((1000 % hz) != 0) {
        ++hz
      }
    }

    periodHz = hz
  }

  public host uint16 getPwmPeriodOnHost() {
    return periodHz
  }

  public uint16 getPwmPeriod() {
    return periodHz
  }

  public bool addChannel(PwmChannel pwm) {
    bool added = true;

    for (uint8 i = 0; i < numChannels; ++i) {
      if (channels[i] == null) {
        channels[i] = pwm
        break;
      } 
      //elif (channels[i] == pwm) {
        //print "ChannelManager timer exists
        //added = false
        //break;
      //}
    }

    if (i == numChannels) { 
      added = false 
    } elif (active == false) {
      PwmManager.start()    // start the pwm manager since its not active
    }

    return added
  }


  ///////////////////////////////////////////////////////////
  // Private functions
  ///////////////////////////////////////////////////////////

  pwmTick() {

    // main pwm manager body here

  }

  start() {
    if (active) { return }
      
    if (periodHz > 0) {
      pwmTimer.start((1000 / periodHz), true)
    }

    active = true
  }

}