# Storage account varibale
variable "storage-account" {
  type = map(object({
    
    # Define the environment name in maximum 4 characters only e.g. PROD,TST,DEV,UAT.
    environment_name            = string                  
    
    # Define the application name of the storage account in max 5 characters only.
    name                        = string                  
   
    # Define the workload in one character only e.g. a, d where a-> app, d-> db 
    workload                    = string                  
    
    # Define the instance number in 2 characters only e.g. 01,02,03
    instance_number             = string                  
    
    # Define the location only if it is other than westeurope. 
    location                    = optional (string , "westeurope")                   
    
    # Defines the resource group name
    resource_group_name         = string 
    #resource_group_name         = optional (string , "RG-OpServices-PROD-WEU-001")                  
    
    # Defines the Tier to use for this storage account. Valid options are Standard and Premium. For BlockBlobStorage and FileStorage accounts only Premium is valid.
    account_tier                = string                  
    
    # Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS.
    account_replication_type    = string                  
    
    # Defines the tags
    tags                        = optional (map(string))       
    
    # Defines whether the public network access is enabled. Defaults to true.
    public_network_access       = optional (bool) 

    # Defines the Kind of account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2. Defaults to StorageV2.
    account_kind                = optional (string)       
    
     # Defines the access tier for BlobStorage, FileStorage and StorageV2 accounts. Valid options are Hot and Cool
    access_tier                 = optional (string)      
    
    # The minimum supported TLS version for the storage account. Possible values are TLS1_0, TLS1_1, and TLS1_2.
    min_tls_version             = optional (string) 

    # Allow or disallow nested items like blob within this Account to opt into being public. Defaults to true.
    allow_blob_public_access    = optional (bool)

    # Boolean flag which forces HTTPS if enabled
    enable_https_traffic_only   = optional (bool)         
    
    # Specifies the number of days that the blob should be retained, between 1 and 365 days.
    blob_retention              = optional (string)       
    
    # Specifies the number of days that the container should be retained, between 1 and 365 days.
    container_retention         = optional (string)       
    
    # Default access to Allow or Deny. This is a mandatory attribute when network rules block is set.
    default_network_access      = optional (string, "Allow")

    # Define the subnet ids that needs to be added in the network rules
    subnet_ids                  = optional (list(string))

    # Define the public IP address that needs to be added in the storage account network rules.
    ip_rules                    = optional (list(string))   

  }))
}

# List of containers in the specific storage accounts
variable "storage-account-containers" {
  type = list
  default = []
}