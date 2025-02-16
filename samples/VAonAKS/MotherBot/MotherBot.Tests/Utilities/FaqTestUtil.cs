﻿// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License.

using System.Collections.Generic;
using System.IO;
using Microsoft.Bot.Builder.AI.QnA;
using Newtonsoft.Json;
using MotherBot.Tests.Mocks;
using MotherBot.Tests.Utterances;

namespace MotherBot.Tests.Utilities
{
    public class FaqTestUtil
    {
        private static Dictionary<string, QueryResult[]> _utterances = new Dictionary<string, QueryResult[]>
        {
            { FaqUtterances.Overview, CreateAnswer(Path.Combine("Resources", "faq_overview.json")) },
        };

        public static MockQnAMaker CreateRecognizer()
        {
            var recognizer = new MockQnAMaker(defaultAnswer: CreateAnswer(Path.Combine("Resources", "faq_default.json")));
            recognizer.RegisterAnswers(_utterances);
            return recognizer;
        }

        public static QueryResult[] CreateAnswer(string jsonPath)
        {
            var content = File.ReadAllText(jsonPath);
            dynamic result = JsonConvert.DeserializeObject(content);
            return result.answers.ToObject<QueryResult[]>();
        }
    }
}
