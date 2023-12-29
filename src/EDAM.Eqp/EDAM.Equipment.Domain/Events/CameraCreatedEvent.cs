﻿using MediatR;
using EDAM.Core.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EDAM.Equipment.Domain.Events
{
    public class CameraCreatedEvent : IDomainEvent, INotification
    {
        public string? DomainData { get; set; }
        public int CameraId { get; }
        public DateTime CreatedDate { get; }

        public CameraCreatedEvent(int cameraId, DateTime createdDate)
        {
            CreatedDate = createdDate;
            CameraId = cameraId;
        }
    }
}
