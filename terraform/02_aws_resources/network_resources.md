# Terraform Networking Example – VPC, Subnet, Internet Gateway, Route Table  

In this example, we are creating the basic networking setup in AWS using Terraform.  

### 1. VPC (Virtual Private Cloud)
```hcl
resource "aws_vpc" "vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  tags = { Name = "dev-vpc" }
}
```
- This creates a private network with CIDR `10.0.0.0/16`.  
- All other networking resources (subnets, route tables, etc.) will be created **inside this VPC**.  

---

### 2. Subnet
```hcl
resource "aws_subnet" "subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.1.0/24"
  tags = { Name = "dev-subnet-01" }
}
```
- A subnet is a smaller block of IP addresses inside the VPC.  
- Notice: `vpc_id = aws_vpc.vpc.id` → this connects the subnet to the VPC we just created.  
- Terraform automatically understands that the **subnet depends on the VPC**.  

---

### 3. Internet Gateway
```hcl
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc.id
  tags = { Name = "dev-igw" }
}
```
- This resource allows instances in the VPC to connect to the Internet.  
- Again, it connects back to the VPC via `vpc_id = aws_vpc.vpc.id`.  

---

### 4. Route Table
```hcl
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = { Name = "dev-rt" }
}
```
- Defines routing rules for network traffic.  
- Here, `0.0.0.0/0 → Internet Gateway` means **all traffic can go to the internet**.  
- Notice how it references `aws_internet_gateway.gw.id`.  

---

### 5. Route Table Association
```hcl
resource "aws_route_table_association" "rta" {
  subnet_id      = aws_subnet.subnet.id
  route_table_id = aws_route_table.rt.id
}
```
- Finally, we associate the subnet with the route table.  
- This ensures that instances launched in the subnet use the route table’s rules.  

---

## 🔗 Key Learning: Resource Connections
- **VPC** is the base resource → Subnet, Internet Gateway, and Route Table connect to it.  
- **Subnet** connects to VPC → `vpc_id = aws_vpc.vpc.id`  
- **Internet Gateway** connects to VPC → `vpc_id = aws_vpc.vpc.id`  
- **Route Table** connects to VPC & Internet Gateway → `gateway_id = aws_internet_gateway.gw.id`  
- **Route Table Association** connects Subnet + Route Table → `subnet_id`, `route_table_id`  

---

👉 **Simple Example to Explain in YouTube**:  
It’s like building a colony:  
- VPC = The colony boundary.  
- Subnet = One block/sector inside colony.  
- Internet Gateway = The colony’s main gate to the city (Internet).  
- Route Table = The directions board telling vehicles where to go.  
- Route Table Association = Assigning one block to use a specific directions board.  
