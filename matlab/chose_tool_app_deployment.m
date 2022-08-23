function [tool, app, deployment] = chose_tool_app_deployment()
  tool_prompt= 'Wybierz narzedzie: \n 1. Ansible \n 2. Fabric \n 3. Bash \n';
  tool_id=input(tool_prompt);
  
  if tool_id == 1
      tool = "ansible";
  elseif tool_id == 2
      tool = "fabric";
  elseif tool_id == 3
      tool = "bash";
  else
      disp("Wrong input - tool")
      tool = "None";
  end
  
  app_prompt= 'Wybierz aplikacje: \n 1. Static \n 2. Grafana \n 3. Tiquet \n';
  app_id=input(app_prompt);
  
  if app_id == 1 && tool ~= "None"
      app = "static";
      deployment_prompt= 'Wybierz deployment: \n 1. Single \n 2. Multi \n';
      deployment_id=input(deployment_prompt);
      if deployment_id == 1
          deployment = "single";
      elseif deployment_id == 2
          deployment = "multi";
      else
        disp("Wrong input - deployment")
        deployment = "None";
      end
  elseif app_id == 2 && tool ~= "None"
      app = "grafana";
      deployment_prompt= 'Wybierz deployment: \n 1. Single \n 2. Split \n 3. Multi \n';
      deployment_id=input(deployment_prompt);
      if deployment_id == 1
          deployment = "single";
      elseif deployment_id == 2
          deployment = "split";
      elseif deployment_id == 3
          deployment = "multi";
      else
        disp("Wrong input - deployment")
        deployment = "None";
      end
  elseif app_id == 3 && tool ~= "None"
      app = "tiquet";
      deployment_prompt= 'Wybierz deployment: \n 1. Single \n 2. Split \n 3. Multi \n';
      deployment_id=input(deployment_prompt);
      if deployment_id == 1
          deployment = "single";
      elseif deployment_id == 2
          deployment = "split";
      elseif deployment_id == 3
          deployment = "multi";
      else
        disp("Wrong input - deployment")
        deployment = "None";
      end
  else
      disp("Wrong input - app")
      app = "None";
  end
end