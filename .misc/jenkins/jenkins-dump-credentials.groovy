import java.nio.charset.StandardCharsets;
def creds = com.cloudbees.plugins.credentials.CredentialsProvider.lookupCredentials(
      com.cloudbees.plugins.credentials.Credentials.class
)

for (c in creds) {
  c.properties.each{k,v ->
    if(k != 'class' && k!= 'descriptor'){
        println(k + ": " + v)
    }
  }
  println()
}
