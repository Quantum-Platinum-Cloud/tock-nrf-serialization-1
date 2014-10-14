module DemoC
{
  uses interface BLEPeripheral;
  uses interface BLELocalService as DemoService;
  uses interface Boot;
}

implementation
{
  event void Boot.booted()
  {
    call BLEPeripheral.startAdvertising();
  }

  event void BLEPeripheral.connected()
  {
    // call HRM.start(1000); // By default, start once a second
  }

  event void BLEPeripheral.disconnected()
  {
    call BLEPeripheral.startAdvertising();
  }

  event void BLEPeripheral.advertisingTimeout()
  {
    call BLEPeripheral.startAdvertising();
  }

}
