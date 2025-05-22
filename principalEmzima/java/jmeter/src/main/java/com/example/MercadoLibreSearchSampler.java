package com.example;

import org.apache.jmeter.config.Arguments;
import org.apache.jmeter.protocol.java.sampler.JavaSamplerClient;
import org.apache.jmeter.protocol.java.sampler.JavaSamplerContext;
import org.apache.jmeter.samplers.SampleResult;


import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;


public class MercadoLibreSearchSampler implements JavaSamplerClient {
    @Override
    public void setupTest(JavaSamplerContext context) {
        // Configuración inicial si es necesaria
    }


    @Override
    public SampleResult runTest(JavaSamplerContext context) {
        SampleResult result = new SampleResult();
        result.sampleStart(); // Comienza el muestreo


        try {
            HttpClient client = HttpClient.newHttpClient();
            String url = context.getParameter("url", "https://www.mercadolibre.com.ar");
            HttpRequest request = HttpRequest.newBuilder()
                    .uri(new URI(url))
                    .GET()
                    .build();


            HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());


            result.setResponseData(response.body(), "UTF-8");
            result.setResponseCode(Integer.toString(response.statusCode()));
            result.setSuccessful(response.statusCode() == 200);
            result.setResponseMessage(response.body().substring(0, Math.min(response.body().length(), 200)) + "..."); // Mostrar solo los primeros 200 caracteres de la respuesta


        } catch (Exception e) {
            result.setSuccessful(false);
            result.setResponseCode("500");
            result.setResponseMessage("Error: " + e.getMessage());
        } finally {
            result.sampleEnd(); // Finaliza el muestreo
        }


        return result;
    }


    @Override
    public void teardownTest(JavaSamplerContext context) {
        // Limpieza si es necesaria
    }


    @Override
    public Arguments getDefaultParameters() {
        Arguments args = new Arguments();
        args.addArgument("searchTerm", "celular samsung");
        args.addArgument("url", "https://www.mercadolibre.com.ar");
        return args;
    }
}
