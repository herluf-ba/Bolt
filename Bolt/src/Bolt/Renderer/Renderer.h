#pragma once

#include "Bolt/Renderer/RenderCommand.h"
#include "Bolt/Renderer/OrthographicCamera.h"
#include "Bolt/Renderer/Shader.h"

#include <glm/glm.hpp>

namespace Bolt {

	class Renderer {
	public:
		static void Init();
		static void BeginScene(OrthographicCamera& camera);
		static void EndScene();

		static void Submit(const Ref<Shader>& shader, const Ref<VertexArray>& vertexArray, const glm::mat4& transform = glm::mat4(1.0f));

		inline static RendererAPI::API GetApi() { return RendererAPI::GetAPI(); }
		
	private:
		struct SceneData {
			glm::mat4 ViewProjectionMatrix;
		};

		static SceneData* s_SceneData;
	};
}