## Auto-Mirrored from Gitlab to Github and to My Registry

## Please make Pull/Merge Requests on my Gitlab, Issues can be raised anywhere 

### Available on my [Gitlab](https://gitlab.nyeprice.space/moby/docker-icinga2-server) 

### Available on [Github](https://github.com/aneurinprice/docker-icinga2-server) 

### Available on [My Registry](https://registry.nyeprice.space) 


## Docker Image ##
`registry.nyeprice.space/docker-icinga2-server/docker-icinga2-server:latest`


## Current Issues: ##
- Config in GIT relies on database password being in SCM
 
  

Is based on _alpine:3.12.1_

Accepts TCP conntections on port 5665

Environment Variables and Default Values:

Variable	            |	Default Value |Acceptable Options     | Usage
----------------------------|-----------------|-----------------------|-----------------
CONFIG_MODE                 |  DISK	      | String: DISK or GIT   | Config must be mounted to /config
----------------------------------------------------------------------------------------
GIT_IDENTITY_KEY	    | ""	      | String: Path to key   | SSH key must be mounted to this location
----------------------------------------------------------------------------------------
GIT_REPOSITORY              | ""              | String: "git@git...." | MUST be the git clone command



## Example command: ##
  - ignore this for now
