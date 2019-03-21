function shutdownParpool()
%SHUTDOWNPARPOOL helper to shutdown the parallel pool
poolobj = gcp('nocreate');
delete(poolobj);
end

