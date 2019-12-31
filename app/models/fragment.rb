class Fragment < ApplicationRecord
  belongs_to :emotion
  belongs_to :tag
  before_save :calculate_emotion_score

  def calculate_emotion_score
    cred = Rails.application.credentials
    cred_hash = {
      type: cred.type,
      project_id: cred.project_id,
      private_key_id: cred.private_key_id,
      private_key: "-----BEGIN PRIVATE KEY-----\n" + cred.private_key + "\nJ+jVc86a92ZaS/Ob8R/o4+K5RYN0XmsRnzeiqzmuK5F405v7kcCDYxpaX9jn5KCp\nyvXXjymdasbwejuYEMZr83hxszPiUTOZOrLAiLa0YOdNt8EurR2PAsKe8te5/m3T\njmvmZOmdzUAjX8IdTn55YxZZ5xQQhbnhFyrieSa8EtJHMcpV9ZwH8wQ6/THcGBRS\ny6F0xjirGk7e/fTVkIow3e19w9FBVs5iPy4mxDizVNbCHItgEk+krq1k1+rJgdiJ\nIpJDNy3jvGUTGGJ/ZgApvuFdvdeEDYrskJqa/KJuNyommFHDV3PgY3eFV45R4KWt\nRkdZ3lWtAgMBAAECggEADQnSpB1pgiNF61CPifYZSk/oC8b7vy+Ctu64o8S+KB+z\nNSworFSdZATPor/5A/IsJ1VerYKce8AKmP1n17QxbQ0916tRexTyzxJc2YwAOK+t\n7eFcwFpXgO+SrWW5JiChOrTwx/n1hQnR/78oXy+b59j/Gs48/riBwuMuXtZFu67y\nmhvtI+4rLQ/Y+Mji3Z/a+44kOlH4pOt1+UFFRG7TyiI0zcWRQ76LVdXkqtUm3Xc8\n0oayErOTg9Qh9VSHcsSh2F9IwFAK4tlpV641Hz1XZhZ5om+1SAOt9idOVyfmxAXI\nlMCXG5yPfB/5oo1HxRSt71zN5hc/48G/gbuZIKXAsQKBgQD2kG4TSIdUvZHIEDjr\n42t5Xxp+RYXkI08eZlYAA8RwjYw0IC3RHdqOK8xdop8MJ4lV9rmmx7N9SlXZjfiu\nV53shIFQCmOwK52ov2uzPWxeBiONYh/oXmcbWHdLrspKxddL/52Narr6T9tRK6H3\n+q58qeyG9Nx6vDnU70Y6iAv3kQKBgQDV0imjya4B+xv2E9/y+gueA7wMM05OuytY\nMfJ1o4gdehY2we/NwNK3IEdYzrzzdaIzz6QIQ71JqRdPqkrW3D49hULfysmrFVHz\naS9VRRi2Y4UlrtImNL3N1HS7haE0DpX2tLtonMHb5wyQryQMi+/e+nLZ/UqRVwUO\n34bKnjgGXQKBgQC2lnYtaYRuSIPwd7LvXFZ2ZusjnzBrpYotpPMCx8ds4iV1ZG8J\ncOYsalrI7GiDg7O8KR2KWFCe87Fnji8eTFvyjp2EPG1eRK5YDIkhDtd1OW6SgJvI\nZEBOi9CsByBfButMqFpwIx2byA9NqNYk4Urdnqg9uI6dhU3+VcLYDW9vQQKBgE+X\nUm6oZQBRw5++2C7uyqJAC6CS/IQsAb9roDAP9lvalSg+2o/BRe5qsoQpOIZ7dCxL\nD2kQJgakTYwW/JKsGvL1huYc6yKm5gFwVvErrj4+H1Lel1UnbruOaQFghZgGEeZq\nchRHvZWolLHKr+WHtXtPyK7CLR6awMQ/ikIj0QD1AoGAC6IklWTozS5DnC5oPsbB\nqYaCgXmeypGa5J9A3DoLHzloIfmgf/UhhOfh5ryq8MODM+71XgEiWVII9dO+B/5a\nSPFsXV3zU8ASEC/hF3M5WvnFW9kHRRpk7zwdAjjdXe/zn+bMnevWMv+Tx1PgSwPK\nQK/bSoh9yUv5XHbGbsvdTyU=\n-----END PRIVATE KEY-----\n",
      client_email: cred.client_email,
      client_id: cred.client_id,
      auth_uri: cred.auth_uri,
      token_uri: cred.token_uri,
      auth_provider_x509_cert_url: cred.auth_provider_x509_cert_url,
      client_x509_cert_url: cred.client_x509_cert_url
    }
    byebug
    @language ||= Google::Cloud::Language.new(credentials: cred_hash)
    response = @language.analyze_sentiment content: content, # ここに分析したい文章
                                          type: :PLAIN_TEXT

    sentiment = response.document_sentiment

    self.score = sentiment.score.to_f.round(1) # float型に変換,少数第2位を四捨五入
    self.magnitude = sentiment.magnitude.to_f.round(1)
  end
end
