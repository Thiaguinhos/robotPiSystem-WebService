package br.com.thiago.robotPi.firebase;

import java.io.IOException;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

public class FirebaseClient {

	private static final MediaType JSON = MediaType.parse("application/json; charset=utf-8");
	protected static final String ERROR = "error";
	protected static final String INVALID_REGISTRATION = "InvalidRegistration";
	protected static final String NOT_REGISTERED = "NotRegistered";
	protected OkHttpClient client = new OkHttpClient();
	protected ObjectMapper mapper = new ObjectMapper();
	private String URL;
	private String API_KEY;

	public FirebaseClient(FirebaseConfig config) throws IOException {
		URL = config.getURL();
		API_KEY = config.getApikey();
	}

	protected Request newRequisicaoParaPost(String json) {
		RequestBody body = RequestBody.create(JSON, json);
		Request request = new Request.Builder().url(URL).addHeader("Authorization", "key=" + API_KEY).post(body)
				.build();
		return request;
	}

	public boolean validatorAPIKey() throws IOException {
		Request request = newRequisicaoParaPost(jsonTeste());
		Response response = client.newCall(request).execute();
		boolean sucesso = response.isSuccessful();
		response.close();
		return sucesso;
	}

	private String jsonTeste() throws JsonProcessingException {
		CloudMensaging mensagem = new CloudMensaging();
		mensagem.setTo("teste");
		String jsonTeste = mapper.writeValueAsString(mensagem);
		return jsonTeste;
	}
}
