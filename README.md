Hello, I am Omkar, also known as Botking, and the owner of this repository.

So what is this repo about? It's a template about an infrastructure deployment frequently used for web servers and load balancers using Terraform and GitLab CI on AWS Cloud. 

So start with setup.
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
##  Setup 

1. #**Prerequisites**#
   
    AWS account with necessary permission for IAM-role  to create and manage  vpc , ec2 , subnet , and route-table.
    Git-lab account for configure and management of pipeline.
    Terraform and AWS CLI installed on local machine.
   
2.#**Setup**#
    
  1. In Git-lab setup secret env variable of our Aws account :- 
  
    TF_VAR_gitlab_token: ${PUT_OUR_ACCESS_TOKEN}
    AWS_ACCESS_KEY_ID: ${PUT_OUR_AWS_KEY}
    AWS_SECRET_ACCESS_KEY : ${PUT_OUR_AWS_ACCESS_KEY} 

  2. Check for your needed requirements :-
       
    For e.g. :- 
        Default :-
            region  = "ap-south-1"  
            instance_type  = "t2.micro"
            ami = "ami-089b4ef4a241e114e"   #Redhat - 9  AMI-image 

    Security groups  , Subnet , Routing table  should be change according your own requirements.
    
   3. Clone the repository :-
      
    1.Without Git-lab :-  #manual deployment 
        Clone the repo :-
            Using  git clone 

        Configure the AWS credential :-
            Using  aws  configure :-   Config the 
                    AWS_ACCESS_KEY_ID: ${PUT_OUR_AWS_KEY}
                    AWS_SECRET_ACCESS_KEY : ${PUT_OUR_AWS_ACCESS_KEY} 
                                             
        Terraform :- 
                    terraform init               #Initializes Terraform 
                    terraform plan               #Generates a plan to show what resources will be created, modified, or destroyed.
                    terraform apply              #Applies the planned changes
                    terraform destroy            #(* Destroy everything  use with care  *)
                    
    #*******************************************************************************************************************************#
    
    2.With Git-lab :-     #Auto deployment
        clone the repo :-
            on the GitLab
            
        configure the AWS credential :-
            Config the :-
                    AWS_ACCESS_KEY_ID: ${PUT_OUR_AWS_KEY}
                    AWS_SECRET_ACCESS_KEY : ${PUT_OUR_AWS_ACCESS_KEY}
                As a environment variable in GitLab
                Run the program 
                note :- apply and destory both need a manual approve 

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#* Important Note *# :-
        This is a basic AWS infrastructure for local testing and deployment. for more complex infrastructure additional configuration is needed like ( private subnet, NATgateway )

 
