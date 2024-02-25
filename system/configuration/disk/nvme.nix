{
 disko.devices.disk.vdb = {
   type   = "disk";
   device = "/dev/nvme0n1";

   content = {
     type = "gpt";

     partitions = {
       ESP = {
         type = "EF00";
         size = "512M";
         content = {
           format     = "vfat";
           mountpoint = "/boot";
           type       = "filesystem";
         };
       };

       root = {
         size = "100%";
         content = {
           mountpoint = "/";
           format     = "xfs";
           type       = "filesystem";
         };
       };
     };
   };
 };
}
