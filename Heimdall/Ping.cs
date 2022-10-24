using System;
using System.Net;
using System.Threading.Tasks;

using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.Azure.WebJobs.Extensions.OpenApi.Core.Attributes;
using Microsoft.Extensions.Logging;

namespace Heimdall
{
    public static class Ping
    {
        private static string _invocationId;

        [FunctionName("Ping")]
        [OpenApiOperation(operationId: "Ping", tags: new[] { "Function health Ping" })]
        [OpenApiResponseWithBody(statusCode: HttpStatusCode.OK, contentType: "application/json", bodyType: typeof(string), Description = "Returns JSON response")]
        public static async Task<IActionResult> Run([HttpTrigger(AuthorizationLevel.Function, "get", Route = "v1/health")] HttpRequest req, ExecutionContext executionContext, ILogger log)
        {

            _invocationId = executionContext.InvocationId.ToString();

            PingResponse pingResponse = new()
            {
                RequestId = _invocationId,
                Application = "Heimdall Functions",
                StatusCode = 0,
                Message = "Heimdall Ping Response",
                CreatedDate = DateTimeOffset.UtcNow
            };

            log.LogInformation("Ping request received: {pingResponse}", pingResponse);

            await Task.Yield();

            return (ActionResult)new OkObjectResult(pingResponse);
        }
    }

    public record PingResponse
    {
        public string RequestId { get; init; }
        public string Application { get; init; }
        public int StatusCode { get; init; }
        public string Message { get; init; }
        public DateTimeOffset CreatedDate { get; init; }
    }

}