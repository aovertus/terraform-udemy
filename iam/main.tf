provider "aws" {
  region = "us-east-2"
  profile = "terraform"
}

resource "aws_iam_user" "myUser" {
  name = "TJ"
}

resource "aws_iam_policy" "customPolicy" {
  name = "GlacierEFSEC2"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "ec2:DeleteManagedPrefixList",
                "ec2:AuthorizeSecurityGroupIngress",
                "ec2:ReplaceRouteTableAssociation",
                "ec2:EnableFastSnapshotRestores",
                "ec2:RejectTransitGatewayPeeringAttachment",
                "ec2:CreateDefaultSubnet",
                "ec2:CreateCapacityReservation",
                "ec2:CreateSpotDatafeedSubscription",
                "ec2:ModifyVpnTunnelCertificate",
                "ec2:RebootInstances",
                "ec2:CreateInstanceExportTask",
                "ec2:DeleteTrafficMirrorFilter",
                "ec2:DeleteLaunchTemplate",
                "ec2:AssignIpv6Addresses",
                "ec2:ImportInstance",
                "ec2:AssociateEnclaveCertificateIamRole",
                "ec2:AcceptVpcEndpointConnections",
                "ec2:ModifyFpgaImageAttribute",
                "ec2:CancelConversionTask",
                "ec2:ImportSnapshot",
                "ec2:RevokeClientVpnIngress",
                "ec2:DeleteTrafficMirrorSession",
                "ec2:DisassociateSubnetCidrBlock",
                "ec2:RegisterTransitGatewayMulticastGroupMembers",
                "ec2:AuthorizeClientVpnIngress",
                "ec2:CreateLaunchTemplate",
                "ec2:ImportClientVpnClientCertificateRevocationList",
                "ec2:DisableVpcClassicLink",
                "ec2:DisableVpcClassicLinkDnsSupport",
                "ec2:AllocateHosts",
                "ec2:CancelImportTask",
                "ec2:ModifyIdFormat",
                "ec2:DeleteFlowLogs",
                "ec2:CopySnapshot",
                "ec2:ModifyVpcEndpointServiceConfiguration",
                "ec2:UnmonitorInstances",
                "ec2:RegisterInstanceEventNotificationAttributes",
                "glacier:AbortMultipartUpload",
                "ec2:DetachClassicLinkVpc",
                "ec2:MonitorInstances",
                "ec2:DeleteVpcPeeringConnection",
                "ec2:CreateTransitGatewayRouteTable",
                "ec2:AcceptVpcPeeringConnection",
                "ec2:ModifyTransitGateway",
                "ec2:DeregisterInstanceEventNotificationAttributes",
                "ec2:DisableVgwRoutePropagation",
                "ec2:CreateTransitGatewayConnectPeer",
                "ec2:CreateVpcEndpoint",
                "ec2:DeleteTransitGatewayConnect",
                "ec2:DisableEbsEncryptionByDefault",
                "ec2:AttachNetworkInterface",
                "glacier:ListProvisionedCapacity",
                "ec2:ResetFpgaImageAttribute"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}

resource "aws_iam_policy_attachment" "policyBind" {
  name = "attachment"
  users = [aws_iam_user.myUser.name]
  policy_arn = aws_iam_policy.customPolicy.arn
}
