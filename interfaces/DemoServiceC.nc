module DemoServiceC
{
  provides interface BLELocalChar as Observer;
  provides interface BLELocalService;
  uses interface SpiPacket as Spi;
}

implementation
{
  typedef struct
  {
    uuid_t UUID;
    uint8_t ObserverDevice[6];
    uint8_t SeenDevice[6];
    uint32_t time;
  } ObserverData;

  ObserverData od = {
    .UUID = {0, 4, 3, 2, 4, 5},
    .ObserverDevice = NULL,
    .SeenDevice = NULL,
    .time = 0
  };

  command uuid_t Observer.getUUID()
  {
  	return od.UUID;
  }
  
  command error_t Observer.setValue(uint16_t len, uint8_t const *value){ return; }
  command error_t Observer.getValue() { return; }

  command error_t Observer.notify(uint16_t len, uint8_t const *value)
  {
  	//set txBuf
  	uint8_t* txBuf = NULL;
  	//Set rxBuf
  	uint8_t* rxBuf = NULL;
  	//append header 
  	//set length
  	uint16_t packet_length = 10;
  	return call Spi.send(txBuf, rxBuf, packet_length);
  }

 
  command error_t Observer.indicate(uint16_t len, uint8_t const *value){return;}

  async event void Spi.sendDone( uint8_t* txBuf, uint8_t* rxBuf, uint16_t len, error_t error )
  {
  	return ;
  }

}