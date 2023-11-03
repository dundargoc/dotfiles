import com.cloudbees.plugins.credentials.*
import com.cloudbees.plugins.credentials.common.*
import com.cloudbees.plugins.credentials.domains.*
import com.cloudbees.plugins.credentials.impl.*
import com.cloudbees.jenkins.plugins.sshcredentials.impl.*
import org.jenkinsci.plugins.plaincredentials.*

def item = Jenkins.instance
//def item = Jenkins.instance.getItem("myFolderName"); // replace with item to get folder or item scoped credentials

def creds = CredentialsProvider.lookupCredentials(
        com.cloudbees.plugins.credentials.Credentials.class,
        item,
        null,
        null
);

for (c in creds) {
    c.properties.each{k,v ->
    if(k != 'class' && k!= 'descriptor'){
        println(k + ": " + v)
    }
  }
  println()
}
