package dev.berehulia;

import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.RequestHandler;

public class Function implements RequestHandler<Object, Object> {

  @Override
  public Object handleRequest(Object object, Context context) {

    context.getLogger().log("Hello, folks!");

    return null;
  }

}