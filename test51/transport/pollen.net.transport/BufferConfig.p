package pollen.net.transport

import Buffer

composition BufferConfig {

   preset BufferConfig() {
        Buffer.maxBufferSize = 124  // configure to desired value
   }
}
